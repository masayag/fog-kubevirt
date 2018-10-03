module Fog
  module Kubevirt
    class Compute
      class Vm < Fog::Model
        include Shared

        identity :name

        attribute :namespace,        :aliases => 'metadata_namespace'
        attribute :resource_version, :aliases => 'metadata_resource_version'
        attribute :uid,              :aliases => 'metadata_uid'
        attribute :labels,           :aliases => 'metadata_labels'
        attribute :owner_reference,  :aliases => 'metadata_owner_reference'
        attribute :annotations,      :aliases => 'metadata_annotations'
        attribute :cpu_cores,        :aliases => 'spec_cpu_cores'
        attribute :memory,           :aliases => 'spec_memory'
        attribute :disks,            :aliases => 'spec_disks'
        attribute :volumes,          :aliases => 'spec_volumes'
        attribute :status,           :aliases => 'spec_running'


        def start(options = {})
          # Change the `running` attribute to `true` so that the virtual machine controller will take it and
          # create the virtual machine instance.
          vm = service.get_raw_vm(name)
          vm = deep_merge!(vm,
            :spec => {
              :running => true
            }
          )
          service.update_vm(vm)
        end

        def stop(options = {})
          vm = service.get_raw_vm(name)
          vm = deep_merge!(vm,
            :spec => {
              :running => false
            }
          )
          service.update_vm(vm)
        end

        def self.parse(object)
          metadata = object[:metadata]
          spec = object[:spec][:template][:spec]
          domain = spec[:domain]
          owner = metadata[:ownerReferences]
          annotations = metadata[:annotations]
          cpu = domain[:cpu]
          vm = {
            :namespace        => metadata[:namespace],
            :name             => metadata[:name],
            :resource_version => metadata[:resourceVersion],
            :uid              => metadata[:uid],
            :labels           => metadata[:labels],
            :memory           => domain[:resources][:requests][:memory],
            :disks            => domain[:devices][:disks],
            :volumes          => spec[:volumes],
            :status           => object[:spec][:running].to_s == "true" ? "running" : "stopped"
          }
          vm[:owner_reference] = owner unless owner.nil?
          vm[:annotations] = annotations unless annotations.nil?
          vm[:cpu_cores] = cpu[:cores] unless cpu.nil?

          vm
        end
      end
    end
  end
end