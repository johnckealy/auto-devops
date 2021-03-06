
![Build](https://github.com/johnckealy/auto-devops/actions/workflows/deploy-prod.yml/badge.svg)

# Auto DevOps

A full production and dev environment for Django and Quasar.

Please bear in mind that some functionality (such as Vagrant and CaddyServer) has not been
generalized, and refers to folders on my local machine. These should be
easy enough to adapt, but you can contact me if you need help setting these up.


### Getting started

To start the development environment, simply run

```bash
make frontend-serve
```

to start the Quasar frontend. Run

```bash
make backend-serve

```
to start the Django Backend.


### Simulating the production environment

Assuming you have `Vagrant` installed locally, you can run

```
vagrant up
```
followed by
```bash
vagrant ssh
```

to start a Vagrant instance, allowing you to simulate the prod environment. Firstly,
a separate Docker container running an instance of `CaddyServer` must be spun up.

Edit the `env/.env.prod` file to specify your directory structure on your VPS (keep the `/vagrant`
directory until the code is moved to your VPS), as well as your preferrred PostgreSQL settings.

Then, you can simply enter the `/vagrant` directory and run

```
make deloy-prod
```

Finally, you must enter your Vagrant instance's IP address in `/etc/hosts` and associate a
domain name to it. This must be the same domain name as the one specified in the `Caddyfile`.
Then hey presto – you have a reverse proxy – you can add new apps with unique domain names simply
by adding the entry to the Caddyfile and running `make deploy-prod` in the new app.


### Flavours

Auto DevOps has four branches:

1) `Main`: Runs an instance of quasar and Django

2) `Static-site`: Runs a basic quasar application

3) `Auth`: Django and Quasar with JWT token authentication set up out of the box

4) `Celery`: Based on Main, with Celery beat set up





