# gitlab-ci-docker-aws(Fork from [ridibooks](ridibooks-docker/gitlab-ci-docker-aws))
[![Build Status](https://travis-ci.org/velugabrewery/gitlab-ci-docker-aws.svg?branch=master)](https://travis-ci.org/ridibooks-docker/gitlab-ci-docker-aws)
[![](https://images.microbadger.com/badges/version/velugabrewery/gitlab-ci-docker-aws.svg)](https://microbadger.com/images/ridibooks/gitlab-ci-docker-aws "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/velugabrewery/gitlab-ci-docker-aws.svg)](https://microbadger.com/images/ridibooks/gitlab-ci-docker-aws "Get your own image badge on microbadger.com")

## Installed
- python3
- node, npm, yarn
- docker-compose
- aws-cli, ecs-cli, awsebcli, s3cmd, chamber, pre-commit
- git, jq, mysql-client
- gettext, gcc

## To build
```bash
bin/build.sh latest
```

## To test
```bash
bin/test.sh
```