# Fluentd output plugin for Logit

This plugin is for Logit customers to send events securely to Logit.

## Installation

    gem install fluent-plugin-logit

## Usage

You need to configure the output with your stack_id and port number. See the source wizard for your configuration.

    <match **>
      type logit
      stack_id <your-stack-id>
      port <your-port>
      buffer_type file
      buffer_path /var/log/fluent/logcentral
    </match>

## Support

This plugin uses TCP with TLS to ship events.

Please contact support@logit.io for support.
