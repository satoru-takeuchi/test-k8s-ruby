#!/usr/bin/ruby

require 'k8s-ruby'

client = K8s::Client.config(
    K8s::Config.load_file(
      File.expand_path '~/.kube/config'
    )
)

client.api('v1').resource('pods', namespace: 'default').list().each do |pod|
  puts "ns=#{pod.metadata.namespace}, name=#{pod.metadata.name}"
end
