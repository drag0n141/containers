<!---
NOTE: AUTO-GENERATED FILE
to edit this file, instead edit its template at: ./github/scripts/templates/README.md.j2
-->
<div align="center">


## Containers

_An opinionated collection of container images_

</div>

<div align="center">

![GitHub Repo stars](https://img.shields.io/github/stars/drag0n141/containers?style=for-the-badge)
![GitHub forks](https://img.shields.io/github/forks/drag0n141/containers?style=for-the-badge)
![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/drag0n141/containers/release-scheduled.yaml?style=for-the-badge&label=Scheduled%20Release)

</div>

Welcome to our container images, if looking for a container start by [browsing the GitHub Packages page for this repo's packages](https://github.com/drag0n141?tab=packages&repo_name=containers).

## Mission statement

The goal of this project is to support [semantically versioned](https://semver.org/), [rootless](https://rootlesscontaine.rs/), and [multiple architecture](https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/) containers for various applications.

We also try to adhere to a [KISS principle](https://en.wikipedia.org/wiki/KISS_principle), logging to stdout, [one process per container](https://testdriven.io/tips/59de3279-4a2d-4556-9cd0-b444249ed31e/), no [s6-overlay](https://github.com/just-containers/s6-overlay) and all images are built on top of [Alpine](https://hub.docker.com/_/alpine) or [Ubuntu](https://hub.docker.com/_/ubuntu).

## Tag immutability

The containers built here do not use immutable tags, as least not in the more common way you have seen from [linuxserver.io](https://fleet.linuxserver.io/) or [Bitnami](https://bitnami.com/stacks/containers).

We do take a similar approach but instead of appending a `-ls69` or `-r420` prefix to the tag we instead insist on pinning to the sha256 digest of the image, while this is not as pretty it is just as functional in making the images immutable.

| Container                                          | Immutable |
|----------------------------------------------------|-----------|
| `ghcr.io/drag0n141/sonarr:latest`                   | ❌         |
| `ghcr.io/drag0n141/sonarr:3.0.8.1507`                | ❌         |
| `ghcr.io/drag0n141/sonarr:latest@sha256:8053...`    | ✅         |
| `ghcr.io/drag0n141/sonarr:3.0.8.1507@sha256:8053...` | ✅         |

_If pinning an image to the sha256 digest, tools like [Renovate](https://github.com/renovatebot/renovate) support updating the container on a digest or application version change._

## Passing arguments to a application

Some applications do not support defining configuration via environment variables and instead only allow certain config to be set in the command line arguments for the app. To circumvent this, for applications that have an `entrypoint.sh` read below.

1. First read the Kubernetes docs on [defining command and arguments for a Container](https://kubernetes.io/docs/tasks/inject-data-application/define-command-argument-container/).
2. Look up the documentation for the application and find a argument you would like to set.
3. Set the argument in the `args` section, be sure to include `entrypoint.sh` as the first arg and any application specific arguments thereafter.

    ```yaml
    args:
      - /entrypoint.sh
      - --port
      - "8080"
    ```

## Configuration volume

For applications that need to have persistent configuration data the config volume is hardcoded to `/config` inside the container. This is not able to be changed in most cases.

## Available Images

Each Image will be built with a `latest` tag, along with tags specific to it's version. Available Images Below

Container | Channel | Image | Latest Tags
--- | --- | --- | ---
[autorestic](https://github.com/drag0n141/containers/pkgs/container/autorestic) | master | ghcr.io/drag0n141/autorestic |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.8](https://img.shields.io/badge/1.8-blue?style=flat-square) ![1.8.2](https://img.shields.io/badge/1.8.2-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[autoscan](https://github.com/drag0n141/containers/pkgs/container/autoscan) | stable | ghcr.io/drag0n141/autoscan |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.4](https://img.shields.io/badge/1.4-blue?style=flat-square) ![1.4.0](https://img.shields.io/badge/1.4.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[cni-plugins](https://github.com/drag0n141/containers/pkgs/container/cni-plugins) | stable | ghcr.io/drag0n141/cni-plugins |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.5](https://img.shields.io/badge/1.5-blue?style=flat-square) ![1.5.0](https://img.shields.io/badge/1.5.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[getmail](https://github.com/drag0n141/containers/pkgs/container/getmail) | stable | ghcr.io/drag0n141/getmail |![6.18.14](https://img.shields.io/badge/6.18.14-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[home-assistant](https://github.com/drag0n141/containers/pkgs/container/home-assistant) | stable | ghcr.io/drag0n141/home-assistant |![2024.5.4](https://img.shields.io/badge/2024.5.4-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[kms](https://github.com/drag0n141/containers/pkgs/container/kms) | master | ghcr.io/drag0n141/kms |![latest](https://img.shields.io/badge/latest-green?style=flat-square) ![svn1113](https://img.shields.io/badge/svn1113-blue?style=flat-square)
[kubernetes-kubectl](https://github.com/drag0n141/containers/pkgs/container/kubernetes-kubectl) | kubectl | ghcr.io/drag0n141/kubernetes-kubectl |![1.30.1](https://img.shields.io/badge/1.30.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr](https://github.com/drag0n141/containers/pkgs/container/lidarr) | master | ghcr.io/drag0n141/lidarr |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square) ![2.3.3](https://img.shields.io/badge/2.3.3-blue?style=flat-square) ![2.3.3.4204](https://img.shields.io/badge/2.3.3.4204-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr-develop](https://github.com/drag0n141/containers/pkgs/container/lidarr-develop) | develop | ghcr.io/drag0n141/lidarr-develop |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.3](https://img.shields.io/badge/2.3-blue?style=flat-square) ![2.3.3](https://img.shields.io/badge/2.3.3-blue?style=flat-square) ![2.3.3.4204](https://img.shields.io/badge/2.3.3.4204-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr-nightly](https://github.com/drag0n141/containers/pkgs/container/lidarr-nightly) | nightly | ghcr.io/drag0n141/lidarr-nightly |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.4](https://img.shields.io/badge/2.4-blue?style=flat-square) ![2.4.0](https://img.shields.io/badge/2.4.0-blue?style=flat-square) ![2.4.0.4211](https://img.shields.io/badge/2.4.0.4211-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[par2cmdline-turbo](https://github.com/drag0n141/containers/pkgs/container/par2cmdline-turbo) | stable | ghcr.io/drag0n141/par2cmdline-turbo |![1.1.1](https://img.shields.io/badge/1.1.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[plex](https://github.com/drag0n141/containers/pkgs/container/plex) | stable | ghcr.io/drag0n141/plex |![1.40.2.8395-c67dce28e](https://img.shields.io/badge/1.40.2.8395--c67dce28e-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[plex-beta](https://github.com/drag0n141/containers/pkgs/container/plex-beta) | beta | ghcr.io/drag0n141/plex-beta |![1.40.2.8395-c67dce28e](https://img.shields.io/badge/1.40.2.8395--c67dce28e-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[postgres-init](https://github.com/drag0n141/containers/pkgs/container/postgres-init) | stable | ghcr.io/drag0n141/postgres-init |![16](https://img.shields.io/badge/16-blue?style=flat-square) ![16.3](https://img.shields.io/badge/16.3-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr](https://github.com/drag0n141/containers/pkgs/container/prowlarr) | master | ghcr.io/drag0n141/prowlarr |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.17](https://img.shields.io/badge/1.17-blue?style=flat-square) ![1.17.2](https://img.shields.io/badge/1.17.2-blue?style=flat-square) ![1.17.2.4511](https://img.shields.io/badge/1.17.2.4511-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr-develop](https://github.com/drag0n141/containers/pkgs/container/prowlarr-develop) | develop | ghcr.io/drag0n141/prowlarr-develop |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.17](https://img.shields.io/badge/1.17-blue?style=flat-square) ![1.17.2](https://img.shields.io/badge/1.17.2-blue?style=flat-square) ![1.17.2.4511](https://img.shields.io/badge/1.17.2.4511-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr-nightly](https://github.com/drag0n141/containers/pkgs/container/prowlarr-nightly) | nightly | ghcr.io/drag0n141/prowlarr-nightly |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.18](https://img.shields.io/badge/1.18-blue?style=flat-square) ![1.18.0](https://img.shields.io/badge/1.18.0-blue?style=flat-square) ![1.18.0.4522](https://img.shields.io/badge/1.18.0.4522-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr](https://github.com/drag0n141/containers/pkgs/container/radarr) | master | ghcr.io/drag0n141/radarr |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.6](https://img.shields.io/badge/5.6-blue?style=flat-square) ![5.6.0](https://img.shields.io/badge/5.6.0-blue?style=flat-square) ![5.6.0.8846](https://img.shields.io/badge/5.6.0.8846-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr-develop](https://github.com/drag0n141/containers/pkgs/container/radarr-develop) | develop | ghcr.io/drag0n141/radarr-develop |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.6](https://img.shields.io/badge/5.6-blue?style=flat-square) ![5.6.0](https://img.shields.io/badge/5.6.0-blue?style=flat-square) ![5.6.0.8846](https://img.shields.io/badge/5.6.0.8846-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr-nightly](https://github.com/drag0n141/containers/pkgs/container/radarr-nightly) | nightly | ghcr.io/drag0n141/radarr-nightly |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.7](https://img.shields.io/badge/5.7-blue?style=flat-square) ![5.7.0](https://img.shields.io/badge/5.7.0-blue?style=flat-square) ![5.7.0.8850](https://img.shields.io/badge/5.7.0.8850-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radicale](https://github.com/drag0n141/containers/pkgs/container/radicale) | stable | ghcr.io/drag0n141/radicale |![3](https://img.shields.io/badge/3-blue?style=flat-square) ![3.2](https://img.shields.io/badge/3.2-blue?style=flat-square) ![3.2.0](https://img.shields.io/badge/3.2.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[readarr-develop](https://github.com/drag0n141/containers/pkgs/container/readarr-develop) | develop | ghcr.io/drag0n141/readarr-develop |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square) ![0.3.26](https://img.shields.io/badge/0.3.26-blue?style=flat-square) ![0.3.26.2526](https://img.shields.io/badge/0.3.26.2526-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[readarr-nightly](https://github.com/drag0n141/containers/pkgs/container/readarr-nightly) | nightly | ghcr.io/drag0n141/readarr-nightly |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.3](https://img.shields.io/badge/0.3-blue?style=flat-square) ![0.3.28](https://img.shields.io/badge/0.3.28-blue?style=flat-square) ![0.3.28.2548](https://img.shields.io/badge/0.3.28.2548-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sabnzbd](https://github.com/drag0n141/containers/pkgs/container/sabnzbd) | stable | ghcr.io/drag0n141/sabnzbd |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.3](https://img.shields.io/badge/4.3-blue?style=flat-square) ![4.3.1](https://img.shields.io/badge/4.3.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[socks5](https://github.com/drag0n141/containers/pkgs/container/socks5) | stable | ghcr.io/drag0n141/socks5 |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.4](https://img.shields.io/badge/1.4-blue?style=flat-square) ![1.4.3](https://img.shields.io/badge/1.4.3-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sonarr](https://github.com/drag0n141/containers/pkgs/container/sonarr) | main | ghcr.io/drag0n141/sonarr |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square) ![4.0.4.1491](https://img.shields.io/badge/4.0.4.1491-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sonarr-develop](https://github.com/drag0n141/containers/pkgs/container/sonarr-develop) | develop | ghcr.io/drag0n141/sonarr-develop |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.4](https://img.shields.io/badge/4.0.4-blue?style=flat-square) ![4.0.4.1692](https://img.shields.io/badge/4.0.4.1692-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[theme-park](https://github.com/drag0n141/containers/pkgs/container/theme-park) | stable | ghcr.io/drag0n141/theme-park |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.16](https://img.shields.io/badge/1.16-blue?style=flat-square) ![1.16.2](https://img.shields.io/badge/1.16.2-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[volsync](https://github.com/drag0n141/containers/pkgs/container/volsync) | stable | ghcr.io/drag0n141/volsync |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.9](https://img.shields.io/badge/0.9-blue?style=flat-square) ![0.9.1](https://img.shields.io/badge/0.9.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)


## Contributing

1. Install [Docker](https://docs.docker.com/get-docker/), [Taskfile](https://taskfile.dev/) & [Cuelang](https://cuelang.org/)
2. Get familiar with the structure of the repositroy
3. Find a similar application in the apps directory
4. Copy & Paste an application and update the directory name
5. Update `metadata.json`, `Dockerfile`, `ci/latest.sh`, `ci/goss.yaml` and make it suit the application build
6. Include any additional files if required
7. Use Taskfile to build and test your image

    ```ruby
    task APP=sonarr CHANNEL=main test
    ```

### Automated tags

Here's an example of how tags are created in the GitHub workflows, be careful with `metadata.json` as it does affect the outcome of how the tags will be created when the application is built.

| Application | Channel   | Stable  | Base    | Generated Tag               |
|-------------|-----------|---------|---------|-----------------------------|
| `ubuntu`    | `focal`   | `true`  | `true`  | `ubuntu:focal-latest`      |
| `ubuntu`    | `focal`   | `true`  | `true`  | `ubuntu:focal-19880312`     |
| `alpine`    | `3.16`    | `true`  | `true`  | `alpine:latest`            |
| `alpine`    | `3.16`    | `true`  | `true`  | `alpine:3.16.0`             |
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:3.0.8.1538` |
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:latest`    |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:3.0.8.1507`         |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:latest`            |

## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.
## Credits

A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors, and [onedr0p](https://github.com/onedr0p).


