# docker-ytarchive

This repository contains Dockerfiles for [Kethsar/ytarchive: A tool for archiving YouTube livestreams from the start](https://github.com/Kethsar/ytarchive) from the community.

Get the Dockerfile on [GitHub](https://github.com/jim60105/ytarchive), or pull the image from [ghcr.io](https://ghcr.io/jim60105/ytarchive) or [Quay.io](https://quay.io/repository/jim60105/ytarchive).

These Dockerfiles are created to construct images using three different base images: Alpine, Red Hat UBI (Universal Base Image), and Google Distroless.  
All of them operate effectively without notable risks, so choose the one that suits your preference.

We used Alpine image as the default.

## Available Pre-built Image

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/jim60105/docker-ytarchive/master?label=%20&style=for-the-badge) ![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/jim60105/docker-ytarchive/docker_publish.yml?label=%20&style=for-the-badge)

> [!NOTE]  
> We run an auto update CI weekly to make the `latest` image up to date with the Kethsar/ytarchive master branch.

```bash
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:latest     [OPTIONS] [url] [quality]
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:v0.4.0     [OPTIONS] [url] [quality]
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:v0.3.2-ubi [OPTIONS] [url] [quality]
```

## Building the Docker Image

### Build Arguments

The Dockerfile accepts one build argument: `VERSION`. This argument is used to specify the version of ytarchive that will be installed in the Docker image. You can use the tags from the ytarchive repository to indicate the version, or you can use the branch name to build a specific branch. Check out the [ytarchive releases](https://github.com/Kethsar/ytarchive/releases) for the available tags and the [ytarchive branches](https://github.com/Kethsar/ytarchive/branches) for building a particular branch.

This repository contains three Dockerfiles for building Docker images based on different base images:

| Dockerfile            | Base Image                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------ |
| Dockerfile            | [Alpine 3.18](https://hub.docker.com/_/alpine/)                                                              |
| Dockerfile.ubi        | [Red Hat UBI9 micro](https://catalog.redhat.com/software/containers/ubi9/ubi-micro/615bdf943f6014fa45ae1b58) |
| Dockerfile.distroless | [Google Distroless static-debian12](https://github.com/GoogleContainerTools/distroless)                      |

Please build them like this:

```bash
docker build -f Dockerfile            --build-arg VERSION=v0.4.0 -t ytarchive:v0.4.0 .
docker build -f Dockerfile.ubi        --build-arg VERSION=master -t ytarchive:ubi .
docker build -f Dockerfile.distroless --build-arg VERSION=v0.3.2 -t ytarchive:v0.3.2-distroless .
```

> [!NOTE]  
> If you are using an earlier version of the docker client, it is necessary to [enable the BuildKit mode](https://docs.docker.com/build/buildkit/#getting-started) when building the image. This is because I used the `COPY --link` feature which enhances the build performance and was introduced in Buildx v0.8.  
> With the Docker Engine 23.0 and Docker Desktop 4.19, Buildx has become the default build client. So you won't have to worry about this when using the latest version.

## Usage Command

```bash
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive [OPTIONS] [url] [quality]
```

Mount the current directory as `/download` and run ytarchive with additional input arguments.
The downloaded files will be saved to where you run the command.

The `[OPTIONS]`, `[url]`, and `[quality]` placeholders should be replaced with the options and arguments for ytarchive. Check the [ytarchive README](https://github.com/Kethsar/ytarchive#usage) for more information.
