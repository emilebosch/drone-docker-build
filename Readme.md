# Docker drone build

This image allows you to access and build docker images faster from
drone.

In order to use this you need to:

- Allow trusted build at your drone registry
- Edit the drone yml to use the following image

The `.drone.yml` file for instance used at our company with pushing to our private
registry.

```
build:
  image: 54hrs/drone-docker-build
  commands:
    - docker login -u registry -p $$REGISTRY_PASSWORD -e fake@fake.fk registry.private.com
    - docker build -t registry.private.com/apps:$CI_COMMIT .
    - docker push registry.private.com/apps:$CI_COMMIT
  volumes:
    - /var/run/docker.sock:/var/run/host.sock:ro
```