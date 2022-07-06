FROM python:3.8-alpine

LABEL name="trufflehog3-actions"
LABEL version="1.0.0"
LABEL repository="https://github.com/ciena-external-collab/trufflehog3-actions"
LABEL homepage="https://github.com/ciena-external-collab/trufflehog3-actions"
LABEL maintainer="CloudTeam"

LABEL "com.github.actions.name"="Trufflehog3 Secret Check"
LABEL "com.github.actions.description"="Scan repository for secrets with basic trufflehog defaults in place for easy setup."
LABEL "com.github.actions.icon"="shield"
LABEL "com.github.actions.color"="yellow"

RUN pip install gitdb2==4.0.2 truffleHog3==2.0.7
RUN apk --update add git less openssh && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/apk/*

ADD entrypoint.sh  /entrypoint.sh
ADD regexes.json /regexes.json

ENTRYPOINT ["/entrypoint.sh"]
