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
[actions-runner](https://github.com/drag0n141/containers/pkgs/container/actions-runner) | stable | ghcr.io/drag0n141/actions-runner |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.322](https://img.shields.io/badge/2.322-blue?style=flat-square) ![2.322.0](https://img.shields.io/badge/2.322.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[autoscan](https://github.com/drag0n141/containers/pkgs/container/autoscan) | stable | ghcr.io/drag0n141/autoscan |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.4](https://img.shields.io/badge/1.4-blue?style=flat-square) ![1.4.0](https://img.shields.io/badge/1.4.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[cdpgvector](https://github.com/drag0n141/containers/pkgs/container/cdpgvector) | stable | ghcr.io/drag0n141/cdpgvector |![0.4.0](https://img.shields.io/badge/0.4.0-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[cni-plugins](https://github.com/drag0n141/containers/pkgs/container/cni-plugins) | stable | ghcr.io/drag0n141/cni-plugins |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.6](https://img.shields.io/badge/1.6-blue?style=flat-square) ![1.6.2](https://img.shields.io/badge/1.6.2-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[getmail](https://github.com/drag0n141/containers/pkgs/container/getmail) | stable | ghcr.io/drag0n141/getmail |![6](https://img.shields.io/badge/6-blue?style=flat-square) ![6.19](https://img.shields.io/badge/6.19-blue?style=flat-square) ![6.19.07](https://img.shields.io/badge/6.19.07-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[home-assistant](https://github.com/drag0n141/containers/pkgs/container/home-assistant) | stable | ghcr.io/drag0n141/home-assistant |![2025.3.3](https://img.shields.io/badge/2025.3.3-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[kms](https://github.com/drag0n141/containers/pkgs/container/kms) | master | ghcr.io/drag0n141/kms |![latest](https://img.shields.io/badge/latest-green?style=flat-square) ![svn1113](https://img.shields.io/badge/svn1113-blue?style=flat-square)
[kubernetes-kubectl](https://github.com/drag0n141/containers/pkgs/container/kubernetes-kubectl) | kubectl | ghcr.io/drag0n141/kubernetes-kubectl |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.32](https://img.shields.io/badge/1.32-blue?style=flat-square) ![1.32.3](https://img.shields.io/badge/1.32.3-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr](https://github.com/drag0n141/containers/pkgs/container/lidarr) | master | ghcr.io/drag0n141/lidarr |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.9](https://img.shields.io/badge/2.9-blue?style=flat-square) ![2.9.6](https://img.shields.io/badge/2.9.6-blue?style=flat-square) ![2.9.6.4552](https://img.shields.io/badge/2.9.6.4552-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr-develop](https://github.com/drag0n141/containers/pkgs/container/lidarr-develop) | develop | ghcr.io/drag0n141/lidarr-develop |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.10](https://img.shields.io/badge/2.10-blue?style=flat-square) ![2.10.1](https://img.shields.io/badge/2.10.1-blue?style=flat-square) ![2.10.1.4589](https://img.shields.io/badge/2.10.1.4589-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[lidarr-nightly](https://github.com/drag0n141/containers/pkgs/container/lidarr-nightly) | nightly | ghcr.io/drag0n141/lidarr-nightly |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.10](https://img.shields.io/badge/2.10-blue?style=flat-square) ![2.10.1](https://img.shields.io/badge/2.10.1-blue?style=flat-square) ![2.10.1.4587](https://img.shields.io/badge/2.10.1.4587-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[periphery](https://github.com/drag0n141/containers/pkgs/container/periphery) | stable | ghcr.io/drag0n141/periphery |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.16](https://img.shields.io/badge/1.16-blue?style=flat-square) ![1.16.12](https://img.shields.io/badge/1.16.12-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[plex](https://github.com/drag0n141/containers/pkgs/container/plex) | stable | ghcr.io/drag0n141/plex |![1.41.5.9522-a96edc606](https://img.shields.io/badge/1.41.5.9522--a96edc606-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[plex-beta](https://github.com/drag0n141/containers/pkgs/container/plex-beta) | beta | ghcr.io/drag0n141/plex-beta |![1.41.5.9522-a96edc606](https://img.shields.io/badge/1.41.5.9522--a96edc606-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[postgres-init](https://github.com/drag0n141/containers/pkgs/container/postgres-init) | stable | ghcr.io/drag0n141/postgres-init |![16](https://img.shields.io/badge/16-blue?style=flat-square) ![16.8](https://img.shields.io/badge/16.8-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr](https://github.com/drag0n141/containers/pkgs/container/prowlarr) | master | ghcr.io/drag0n141/prowlarr |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.31](https://img.shields.io/badge/1.31-blue?style=flat-square) ![1.31.2](https://img.shields.io/badge/1.31.2-blue?style=flat-square) ![1.31.2.4975](https://img.shields.io/badge/1.31.2.4975-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr-develop](https://github.com/drag0n141/containers/pkgs/container/prowlarr-develop) | develop | ghcr.io/drag0n141/prowlarr-develop |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.32](https://img.shields.io/badge/1.32-blue?style=flat-square) ![1.32.1](https://img.shields.io/badge/1.32.1-blue?style=flat-square) ![1.32.1.4983](https://img.shields.io/badge/1.32.1.4983-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[prowlarr-nightly](https://github.com/drag0n141/containers/pkgs/container/prowlarr-nightly) | nightly | ghcr.io/drag0n141/prowlarr-nightly |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.32](https://img.shields.io/badge/1.32-blue?style=flat-square) ![1.32.2](https://img.shields.io/badge/1.32.2-blue?style=flat-square) ![1.32.2.4985](https://img.shields.io/badge/1.32.2.4985-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr](https://github.com/drag0n141/containers/pkgs/container/radarr) | master | ghcr.io/drag0n141/radarr |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.19](https://img.shields.io/badge/5.19-blue?style=flat-square) ![5.19.3](https://img.shields.io/badge/5.19.3-blue?style=flat-square) ![5.19.3.9730](https://img.shields.io/badge/5.19.3.9730-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr-develop](https://github.com/drag0n141/containers/pkgs/container/radarr-develop) | develop | ghcr.io/drag0n141/radarr-develop |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.20](https://img.shields.io/badge/5.20-blue?style=flat-square) ![5.20.0](https://img.shields.io/badge/5.20.0-blue?style=flat-square) ![5.20.0.9752](https://img.shields.io/badge/5.20.0.9752-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radarr-nightly](https://github.com/drag0n141/containers/pkgs/container/radarr-nightly) | nightly | ghcr.io/drag0n141/radarr-nightly |![5](https://img.shields.io/badge/5-blue?style=flat-square) ![5.20](https://img.shields.io/badge/5.20-blue?style=flat-square) ![5.20.1](https://img.shields.io/badge/5.20.1-blue?style=flat-square) ![5.20.1.9768](https://img.shields.io/badge/5.20.1.9768-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[radicale](https://github.com/drag0n141/containers/pkgs/container/radicale) | stable | ghcr.io/drag0n141/radicale |![3](https://img.shields.io/badge/3-blue?style=flat-square) ![3.4](https://img.shields.io/badge/3.4-blue?style=flat-square) ![3.4.1](https://img.shields.io/badge/3.4.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[readarr-develop](https://github.com/drag0n141/containers/pkgs/container/readarr-develop) | develop | ghcr.io/drag0n141/readarr-develop |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.4](https://img.shields.io/badge/0.4-blue?style=flat-square) ![0.4.12](https://img.shields.io/badge/0.4.12-blue?style=flat-square) ![0.4.12.2753](https://img.shields.io/badge/0.4.12.2753-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[readarr-nightly](https://github.com/drag0n141/containers/pkgs/container/readarr-nightly) | nightly | ghcr.io/drag0n141/readarr-nightly |![0](https://img.shields.io/badge/0-blue?style=flat-square) ![0.4](https://img.shields.io/badge/0.4-blue?style=flat-square) ![0.4.13](https://img.shields.io/badge/0.4.13-blue?style=flat-square) ![0.4.13.2754](https://img.shields.io/badge/0.4.13.2754-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sabnzbd](https://github.com/drag0n141/containers/pkgs/container/sabnzbd) | stable | ghcr.io/drag0n141/sabnzbd |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.4](https://img.shields.io/badge/4.4-blue?style=flat-square) ![4.4.1](https://img.shields.io/badge/4.4.1-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[socks5](https://github.com/drag0n141/containers/pkgs/container/socks5) | stable | ghcr.io/drag0n141/socks5 |![1](https://img.shields.io/badge/1-blue?style=flat-square) ![1.4](https://img.shields.io/badge/1.4-blue?style=flat-square) ![1.4.3](https://img.shields.io/badge/1.4.3-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sonarr](https://github.com/drag0n141/containers/pkgs/container/sonarr) | main | ghcr.io/drag0n141/sonarr |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.13](https://img.shields.io/badge/4.0.13-blue?style=flat-square) ![4.0.13.2932](https://img.shields.io/badge/4.0.13.2932-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[sonarr-develop](https://github.com/drag0n141/containers/pkgs/container/sonarr-develop) | develop | ghcr.io/drag0n141/sonarr-develop |![4](https://img.shields.io/badge/4-blue?style=flat-square) ![4.0](https://img.shields.io/badge/4.0-blue?style=flat-square) ![4.0.13](https://img.shields.io/badge/4.0.13-blue?style=flat-square) ![4.0.13.2934](https://img.shields.io/badge/4.0.13.2934-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)
[whisparr-nightly](https://github.com/drag0n141/containers/pkgs/container/whisparr-nightly) | nightly | ghcr.io/drag0n141/whisparr-nightly |![2](https://img.shields.io/badge/2-blue?style=flat-square) ![2.0](https://img.shields.io/badge/2.0-blue?style=flat-square) ![2.0.0](https://img.shields.io/badge/2.0.0-blue?style=flat-square) ![2.0.0.819](https://img.shields.io/badge/2.0.0.819-blue?style=flat-square) ![latest](https://img.shields.io/badge/latest-green?style=flat-square)


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
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:3.0.8.1538` |
| `sonarr`    | `develop` | `false` | `false` | `sonarr-develop:latest`     |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:3.0.8.1507`         |
| `sonarr`    | `main`    | `true`  | `false` | `sonarr:latest`             |

## Deprecations

Containers here can be **deprecated** at any point, this could be for any reason described below.

1. The upstream application is **no longer actively developed**
2. The upstream application has an **official upstream container** that follows closely to the mission statement described here
3. The upstream application has been **replaced with a better alternative**
4. The **maintenance burden** of keeping the container here **is too bothersome**

**Note**: Deprecated containers will remained published to this repo for 6 months after which they will be pruned.
## Credits

A lot of inspiration and ideas are thanks to the hard work of [hotio.dev](https://hotio.dev/) and [linuxserver.io](https://www.linuxserver.io/) contributors, and [onedr0p](https://github.com/onedr0p).


