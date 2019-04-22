#!/usr/bin/env bash

set -e


if [ -f .env ]
then
    echo "use .env"
    source .env
else
    echo "use ../.env"
    source ../.env
fi


DOCKER_TAG=${1}

function print_usage
{
    echo
    echo "Usage: build.sh <DOCKER_TAG>"
    echo
    echo "Example:"
    echo "  build.sh latest"
}

if [[ -z "${IMAGE_NAME}" ]]
then
    if [[ "${DOCKER_TAG}" ]]
    then
        IMAGE_NAME="gitlab-ci-docker-aws:${DOCKER_TAG}"
    else
        echo "No DOCKER_TAG specified."
        print_usage
        exit 1
    fi
fi

echo "=> Building start with args"
echo "CONTAINER_ARCHITECTURE=${CONTAINER_ARCHITECTURE}"
echo "AWS_CLI_VERSION=${AWS_CLI_VERSION}"
echo "ECS_CLI_VERSION=${ECS_CLI_VERSION}"
echo "EB_CLI_VERSION=${EB_CLI_VERSION}"
echo "S3_CMD_VERSION=${S3_CMD_VERSION}"
echo "DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}"
echo "CHAMBER_VERSION=${CHAMBER_VERSION}"
echo "NODEJS_VERSION=${NODEJS_VERSION}"

echo "Build a image - ${IMAGE_NAME}"
docker build --pull \
  --build-arg "CONTAINER_ARCHITECTURE=${CONTAINER_ARCHITECTURE}" \
  --build-arg "AWS_CLI_VERSION=${AWS_CLI_VERSION}" \
  --build-arg "ECS_CLI_VERSION=${ECS_CLI_VERSION}" \
  --build-arg "EB_CLI_VERSION=${EB_CLI_VERSION}" \
  --build-arg "S3_CMD_VERSION=${S3_CMD_VERSION}" \
  --build-arg "DOCKER_COMPOSE_VERSION=${DOCKER_COMPOSE_VERSION}" \
  --build-arg "CHAMBER_VERSION=${CHAMBER_VERSION}" \
  --build-arg "NODEJS_VERSION=${NODEJS_VERSION}" \
  -t "${IMAGE_NAME}" .
