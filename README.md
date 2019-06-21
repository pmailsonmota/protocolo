# PROTOCOLO ELETRÔNICO WEB 
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

## INTRODUÇÃO

Sistema de Protocolo Eletrônico é uma ferramenta de gestão de processos administrativos utilizada no âmbito do Ministério do Planejamento, Desenvolvimento e Gestão. Essa ferramenta permite que quaisquer pessoas físicas ou pessoas jurídicas, por meio de seus representantes legais, protocolem documentos mediante a realização de um breve cadastro.

## REQUESITOS DE HARDWARE

Os requisitos de hardware dependem quase que inteiramente do tamanho e do número de arquivos que estão sendo processados. Essas recomendações devem ser consideradas como o mínimo para um sistema de produção e para testes de funcionalidade:

* Processador: 2 núcleos de CPU;
* Memória: 4GB;
* Espaço em disco (processamento): 20 GB.


## REQUESITOS DE SOFTWARE


* Java (JDK8)
* MySQL 5.7 ou superior (Banco de Dados)
* Apache 2 (Servidor de aplicação)
* Linux (Sistema Operacional)


O sistema de Protocolização Web faz o uso de um diretório do sistema operacional para guardar os arquivos físicos em PDF. As configurações ficam no banco de dados.

## INSTALAÇÃO

Assume-se aqui que o seu sistema operacional host é o Ubuntu. Isso pode ser modificado para um sistema operacional diferente baseado em Unix, como o Mac OS X ou outra distribuição do Linux, como o CentOS. Essas instruções não funcionarão se você estiver usando o Windows como o sistema operacional host. Para instalações no Windows, você pode criar uma máquina virtual e seguir as instruções de instalação manual.

## INSTRUÇÕES
O Protocolo Eletrônico já está dockerizado, portanto ele pode ser instalado utilizando o docker ou em um servidor de aplicação direto do servidor. Estas instruções serão separadas em duas partes uma para docker e outra via Tomcat.


## 1. Instalação via Tomcat

### PRÉ-REQUISITOS
   Para que a configuração da aplicação seja efetuada corretamente será necessário ter instalado no ambiente desejado os seguintes requisitos:
* JDK8 ou superior;
* Mysql 5.7 ou superior;
* Maven 3 ou superior.

### CONFIGURANDO DE BANCO DE DADOS

Crie uma base de dados chamada “protocolo” dentro do seu banco de dados Mysql;

Execute o seguinte comando
```
mysql -uMYSQL_USER -pMYSQL_PASSWORD protocolo < protocolo-web-db.sql
```

### CONFIGURANDO O SISTEMA

Adicione no arquivo “conf/context.xml” do tomcat 8.5 a tag xml abaixo dentro da tag Context:
```
    <Resource
        name="jdbc/protocoloDB"
        auth="Container"
        type="javax.sql.DataSource"
        maxActive="100"
        maxIdle="30"
        maxWait="10000"
        driverClassName="com.mysql.jdbc.Driver"
        url="jdbc:mysql://MYSQL_HOST:MYSQL_PORT/MYSQL_DB?useSSL=false"
        username="MYSQL_USER"
        password="MYSQL_PASSWORD" 
    />
```	


Criar uma pasta chamada “protocolo_arquivos” dentro da “/opt” e dar permissão de escrita 777;

#### Compilação
Entrar na pasta onde o projeto foi clonado e executar o comando abaixo como root;
```
mvn dependency:resolve-plugins clean install
```
Após o projeto ter sido compilado entre na pasta /target e Copie o arquivo protocolo.war para a pasta webapps do seu tomcat 8.5;

## 2. Instalação via Docker

Assume-se aqui que o seu sistema operacional host é o Debian 8 ou superior. Isso pode ser modificado para um sistema operacional diferente baseado em Unix, como o Mac OS X ou outra distribuição do Linux, como o CentOS. Essas instruções não funcionarão se você estiver usando o Windows como o sistema operacional host. Para instalações no Windows, você pode criar uma máquina virtual e seguir as instruções de instalação manual.

### INSTRUÇÕES

```
$
$ echo "Parametros "
$ 
$ set HOSTNAME="Informe aqui o hostname da aplicação"
$
$ set REPOSITORIO-GIT="Informe aqui a url do repositorio Git"
$
$ set GRUPO-GIT="Informe aqui o nome do grupo do projeto no repositorio Git"
$
$ set TAG="Informe aqui a tag criada para o projeto no repositorio Git"
$
$ echo "Container para o serviço de banco de dados MySQL 5.7 "
$
$ docker run \
    --restart unless-stopped \
    --name protocolo-banco \
    --publish 3306:3306 \
    --volume /opt/protocolo/mysql:/var/lib/mysql \
    --env ALLOW_EMPTY_PASSWORD=yes \
    --env MYSQL_ROOT_PASSWORD=root \
    --env MYSQL_USER=protocolo \
    --env MYSQL_PASSWORD=protocolo \
    --env MYSQL_DATABASE=protocolo \
    --detach \
    mysql:5.7 --character-set-server=utf8  --collation-server=utf8_unicode_ci
$ 
$ echo "Gerando a aplicação Protocolo Web "
$
$ git clone http://${REPOSITORIO-GIT}/${GRUPO-GIT}/protocolo.implementacao.git
$
$ cd protocolo.implementacao
$
$ sed -i -e "s|<version>TAG</version>|<version>${TAG}</version>|" pom.xml
$
$ sed -i -e "s|url *=.*|url=\"jdbc:mysql://${HOSTNAME}:3306/protocolo?useSSL=false\"|" \
         -e "s|username *=.*|username=\"protocolo\"|" \
         -e "s|password *=.*|password=\"protocolo\"|" \
         docker/FILES/context.xml
$
$ mvn clean \
      install \
      -Dflyway.user=protocolo \
      -Dflyway.password=protocolo \
      -Dflyway.url=jdbc:mysql://${HOSTNAME}:3306/protocolo?useSSL=false \
      flyway:migrate
$
$ cp -f target/protocolo.war docker/FILES/
$
$ cd docker/
$
$ docker build --tag ${GRUPO-GIT}/protocolo.implementacao:${TAG} .
$
$ echo "Subindo aplicacao Protocolo... "
$
$ docker run \
    --restart unless-stopped \
    --name protocolo \
    --env JAVA_OPTS="-Xmx1024m -Duser.timezone=America/Sao_Paulo"
    --publish 8080:8080 \
    --detach \
    ${GRUPO-GIT}/protocolo.implementacao:${TAG}
$
$ echo "Abra o navegador e acesse a url: http://<Host aonde estao os serviços>:8080/protocolo"
$
$ echo "Faça o login com as credenciais: "
$
$ echo "Usuario: admin@admin.com"
$
$ echo "Senha: 123456"
$
```
## Licenças

### GPL v3
Este programa é um software livre: você pode redistribuí-lo e/ou
modificá-lo sob os termos da Licença Pública Geral GNU, conforme
publicado pela Free Software Foundation, seja a versão 3 da Licença
ou (a seu critério) qualquer versão posterior.

Este programa é distribuído na esperança de que seja útil,
mas SEM QUALQUER GARANTIA; sem a garantia implícita de
COMERCIALIZAÇÃO OU ADEQUAÇÃO A UM DETERMINADO PROPÓSITO. Veja a
Licença Pública Geral GNU para obter mais detalhes.

Veja em: https://www.gnu.org/licenses/gpl-3.0.pt-br.html

### Creative Commons
Protocololização Web é licenciado sob a licença
Atribuição-NãoComercial-CompartilhaIgual 4.0 Internacional 4.0 .

Veja em: https://creativecommons.org/licenses/by-nc-sa/4.0/legalcode.pt﻿## PROTOCOLO ELETRÔNICO WEB [![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/) [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
