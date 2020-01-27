# Runit

Definition as per Wikipedia.

> [runit](http://smarden.org/runit/) is an init scheme for Unix-like operating systems that initializes, supervises, and ends processes throughout the operating system.

There are many other schemes available like `sysvinit`, `upstart`, `systemd` and `supervisord`. We'll be using runit as an init scheme for our container but before proceeding any further.

[Runit quick-start](https://kchard.github.io/runit-quickstart/) would be useful prior to diving into it and using it as an init scheme in our docker container.

Runit expects the service directory under **/etc/service** like `/etc/service/<serviceName>/` and the script name should be **`run`** like `/etc/service/<serviceName>/run` and with executable permission. It performs the system's booting, running and shutting down in three stages. These stages are located under `/etc/runit/` i.e. `/etc/runit/1`, `/etc/runit/2` and `/etc/runit/3` respectively. All stages are actually scripts, to make it work properly they should have executable permission.

## Docker Container Philosophy

Docker works on the phenomena of a single service per container which means when your container is running the only process running as `PID 1` is your `CMD/ENTRYPOINT` instruction in your `Dockerfile`. To make your containers light there is no init scheme available unless you introduce it explicitly in your container. You can use `--init` flag while executing your container as instructed by the [docker team](https://docs.docker.com/config/containers/multi-service_container/). 

They don't restrict you to only run single process per container there are some cases when your service depends upon multiple processes. For example `LAMP stack` which does need a database and a webserver, to be run simultaneously to complete our LAMP stack. One can split it into multiple containers, one for the database and one for the webserver but what if you want to containerize LAMP stack into a single docker container. 

For these cases you do need an init scheme in your container to look after the process, execute multiple processes and terminate them properly. If you want to explore **PID 1 problem** you can check the following [link](https://blog.phusion.nl/2015/01/20/docker-and-the-pid-1-zombie-reaping-problem/). It does explain it thoroughly, what are the zombie processes and why there is a need of a process management system in our container. But it depends on what you're containerizing and your case may be different.

## References
http://smarden.org/runit/

https://kchard.github.io/runit-quickstart/

https://docs.docker.com/config/containers/multi-service_container/

https://blog.phusion.nl/2015/01/20/docker-and-the-pid-1-zombie-reaping-problem/