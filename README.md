# Sala de Reunião

Sistema desenvolvido em Ruby on Rails para controlar as reservas de uma sala de reunião

* Versão do Rails 6.1.3
* Banco de dados: Postgres

## Para rodar o projeto

##### 1. Clone o repositório
```bash
git clone https://github.com/MateusVS/Sala-reuniao-ruby-on-rails
```
##### 2. Renomeie o arquivo .env.example para .env
E altere as configurações do banco de dados para se adequar ao seu ambiente

##### 3. Criação das tabelas do banco de dados

Execute o seguinte comando para rodar as migrations

```ruby
rails db:migrate
```

##### 4. Inicie o servidor 

Você pode iniciar o servidor utilizando o seguinte comando

```ruby
rails s
```

Sua aplicação estara disponível em http://localhost:3000
