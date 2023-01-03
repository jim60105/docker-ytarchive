# Dockerize ytarchive

This is a Dockerfile for [Kethsar/ytarchive](https://github.com/Kethsar/ytarchive).

## Usage

```bash
docker run -it --rm -v ${PWD}:/download jim60105/docker-ytarchive:v0.3.2 [OPTIONS] [url] [quality]
```

- Mount a volume to `/download` to save the downloaded files.
- Options and arguments are the same as the original ytarchive.
