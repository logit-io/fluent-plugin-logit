# Fluentd output plugin for Logit

[![Build Status](https://travis-ci.org/logit-io/fluent-plugin-logit.svg?branch=master)](https://travis-ci.org/logit-io/fluent-plugin-logit)

This plugin is for Logit customers to send events securely to Logit.

## Installation

    gem install fluent-plugin-logit

## Usage

You need to configure the output with your stack_id and port number. See the source wizard for your configuration.

    <match **>
      @type logit
      stack_id <your-stack-id>
      port <your-port>
      buffer_type file
      buffer_path /var/log/fluent/logcentral
    </match>

### Mutual TLS configuration

If your stack is enabled for mutual TLS, make the client certificate, private
key, and CA chain certificates available to Fluentd and specify their locations
in the config:

    <match **>
      @type logit
      stack_id <your-stack-id>
      port <your-port>
      buffer_type file
      buffer_path /var/log/fluent/logcentral
      tls_mode mutual
      tls_ca_certificate "/etc/pki/tls/logit/ca-chain.pem"
      tls_certificate "/etc/pki/tls/logit/client.pem"
      tls_private_key "/etc/pki/tls/logit/key.pem"
    </match>

The private key file must be unencrypted before use.

## Support

This plugin uses TCP with TLS to ship events.

Please contact support@logit.io for support.
