<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="200" alt="Nest Logo" /></a>
</p>

## Description

[Nest](https://github.com/nestjs/nest)-powered starter project with Prisma and Docker support.

## Installation

```bash
$ npm install
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

## Packaging App as Executable

See `pkg` object inside `package.json` to see files that are included in the executable files.

```bash
$ npm run package
```

This command will create executable for Windows 64 bit, Linux 64 bit, and MacOS Intel x64 under `executables` directory.

## Creating Docker Image

Run the Docker CLI

``` bash
$ docker build -t TAG .
```
### Using dok

Or alternatively use [dok](https://github.com/alwint3r/dok)

```bash
$ dok TAG
```

If you want `dok` to automatically push the image to a remote repository, add `remote-url` to `.dokfile` and run the following command to push the previously built image.

```bash
$ dok TAG pushOnly
```

After providing `remote-url` to `.dokfile` you can just run the following command to build, tag, and push the image to the remote repository.

```bash
$ dok TAG
```

Run the following command if you want to build the image but you don't want to push it to the remote repository

```bash
$ dok TAG buildOnly
```