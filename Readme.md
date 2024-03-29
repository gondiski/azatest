# FX Transaction Microservice implementation in Ruby on Rails


## Install

### Clone the repository

```shell
git clone https://github.com/gondiski/azatest.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.6`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

```shell
rbenv install 2.7.6
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler):

```shell
bundle
```
### API Key
Generate an API key from [Exchange Rate API](https://v6.exchangerate-api.com/v6/) and include it in your .env file

### Set environment variables

Using [Dotenv](https://github.com/bkeepers/dotenv):

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```
