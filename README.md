# docker-ytarchive

This repository contains Dockerfiles for [Kethsar/ytarchive: A tool for archiving YouTube livestreams from the start](https://github.com/Kethsar/ytarchive) from the community.

Get the Dockerfile on [GitHub](https://github.com/jim60105/docker-ytarchive), or pull the image from [ghcr.io](https://ghcr.io/jim60105/ytarchive) or [Quay.io](https://quay.io/repository/jim60105/ytarchive).

These Dockerfiles are created to construct images using three different base images: scratch, Red Hat UBI (Universal Base Image), and Google Distroless.

We used scratch image as the default.

## Available Pre-built Image

![GitHub last commit (branch)](https://img.shields.io/github/last-commit/jim60105/docker-ytarchive/master?label=%20&style=for-the-badge) ![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/jim60105/docker-ytarchive/docker_publish.yml?label=%20&style=for-the-badge)

> [!NOTE]  
> We run an auto update CI weekly to make the `latest` image up to date with the Kethsar/ytarchive master branch.

```bash
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:latest     [OPTIONS] [url] [quality]
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:v0.5.0     [OPTIONS] [url] [quality]
docker run -it -v ".:/download" ghcr.io/jim60105/ytarchive:v0.4.0-ubi [OPTIONS] [url] [quality]
```

## Building the Docker Image

### Build Arguments

The Dockerfile accepts one build argument: `VERSION`. This argument is used to specify the version of ytarchive that will be installed in the Docker image. You can use the tags from the ytarchive repository to indicate the version, or you can use the branch name to build a specific branch. Check out the [ytarchive releases](https://github.com/Kethsar/ytarchive/releases) for the available tags and the [ytarchive branches](https://github.com/Kethsar/ytarchive/branches) for building a particular branch.

This repository contains three Dockerfiles for building Docker images based on different base images:

| Dockerfile            | Base Image                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------ |
| Dockerfile            | [scratch](https://hub.docker.com/_/scratch/)                                                                 |
| ubi.Dockerfile        | [Red Hat UBI9 micro](https://catalog.redhat.com/software/containers/ubi9/ubi-micro/615bdf943f6014fa45ae1b58) |
| distroless.Dockerfile | [Google Distroless static-debian12](https://github.com/GoogleContainerTools/distroless)                      |

Please build them like this:

```bash
docker build -f Dockerfile            --build-arg VERSION=v0.5.0 -t ytarchive:v0.5.0 .
docker build -f ubi.Dockerfile        --build-arg VERSION=master -t ytarchive:ubi .
docker build -f distroless.Dockerfile --build-arg VERSION=v0.3.2 -t ytarchive:v0.3.2-distroless .
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

## License

> The main program, ytarchive, is distributed under [MIT](https://github.com/Kethsar/ytarchive/blob/master/LICENSE).  
> Please consult their repository for access to the source code and licenses.  
> The following is the license for the Dockerfiles and CI workflows in this repository.

> [!CAUTION]
> A GPLv3 licensed Dockerfile means that you _**MUST**_ **distribute the source code with the same license**, if you
>
> - Re-distribute the image. (You can simply point to this GitHub repository if you doesn't made any code changes.)
> - Distribute a image that uses code from this repository.
> - Or **distribute a image based on this image**. (`FROM ghcr.io/jim60105/ytarchive` in your Dockerfile)
>
> "Distribute" means to make the image available for other people to download, usually by pushing it to a public registry. If you are solely using it for your personal purposes, this has no impact on you.
>
> Please consult the [LICENSE](LICENSE) for more details.

<img src="https://github.com/jim60105/docker-ytarchive/assets/16995691/782f16b9-3f49-49ef-943d-a29324fcc8db" alt="gplv3" width="200" />

[GNU GENERAL PUBLIC LICENSE Version 3](LICENSE)

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.
