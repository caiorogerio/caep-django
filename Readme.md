# Bem vindo ao código fonte do novo site do CAEP

Olá, estas são as instruções de instalação do novo site do CAEP. 


# Instalação

## Pacote

Descompacte o **zip**

## Dependências

As dependências de bibliotecas do Python estão geridas pelo pip. Desta forma, pode-se usar o **virtualenv**, sabendo que o ambiente venv para **Windows 11** já está disponível no pacote.

```
pip install -r requirements.txt
```

## Banco de dados

É possível redefinir a base de dados utilizando-se o **manager.py** do Django. Porém o pacote possui um dump file **caep.sql** no formato MySQL/MariaDB com informações de teste.

## Dados de teste

**Administrador**
URL: http://localhost:8000/admin
Usuário: admin@caep.com.br
Senha: caep2021

**Usuário**
URL: http://localhost:8000
Usuário: usuario@caep.com.br
Senha: caep2021

# Repositório

Gostou do projeto e quer expandir ou colaborar. Está tudo no Github #JustForkIt
https://github.com/caiorogerio/caep-django 

# Produção
Este projeto já pode ser conferido em produção no Heroku (as imagens não ficam salvas, já que o server é stateless)
http://caep.tk
