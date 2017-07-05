FROM fluent/fluentd:latest
MAINTAINER Patrick McEvoy <pmcevoy@logit.io>

RUN gem install fluent-plugin-logit -v 0.1.0

# To allow the file buffer to work
RUN chmod 777 /tmp
