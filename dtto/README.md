# Dtto

## Setup
Install asdf and task first

### Install tools & dependencies

```
task init
```

### Populate .env
Create a .env.local file and put in the following env vars

```
DIRECTUS_ACCESS_TOKEN=
DIRECTUS_BASE_URL=
```

### Run server

```
task elixir:start
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
