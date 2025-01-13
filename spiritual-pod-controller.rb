#!/usr/bin/ruby

require 'k8s-ruby'

client = K8s::Client.config(
    K8s::Config.load_file(
      File.expand_path '~/.kube/config'
    )
)

client.api('v1').resource('pods', namespace: 'default').watch() do |event|
  pod = client.api('v1').resource('pods', namespace: 'default').get(event.resource.metadata.name)
  pod.metadata.annotations['spiritual-message'] = "ﾀｽｹﾃ..."
  client.api('v1').resource('pods', namespace: 'default').update_resource(pod)
end
