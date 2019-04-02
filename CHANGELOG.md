### 1.1.1 / 2019-04-03

* Make VmNic fog model
* Minor bug

### 1.1.0 / 2019-03-31

* Replace VmVolume with Volume as main collection
* Allow to create vm with multiple pvcs
* Rename Volume to PersistentVolume
* Add support for Storage Class
* Make VmVolume a Fog model
* Extend VMs, VM Instances and servers

### 1.0.2 / 2019-02-27

* Asdd Watch VMIs
* Differentiate status and state
* Change kubevirt api version
* Change registry to container disk
* Remove bundler dependency
* Bump kubeclient to 4.1.2
* Support Persistent Volume Claims
* Support Persistent Volumes
* Support networks and interfaces
* Volume name should respect restrictions
* Introduce config file based client
* Add vm cloud-init support
* server and servers
* Allow local Gemfile.dev.rb
* Support services
* Make VM memory optional

### 1.0.1 / 2018-10-09

* fog-core bumped to 2.1.1
* Namespace change to Fog::Kubevirt per fog-core 2
* Added VM status property
* Allow to create VM without a template

### 0.1.6 / 2018-07-16

* Support openshift parameters processing ${{PARAM_NAME}} in templates.

### 0.1.4 / 2018-06-25

* Save resource_version and kind for entitiy collections

### 0.1.3 / 2018-06-17

* Work against api v1alpha2
* Change code to match new entities names:
  VirtualMachine ==> VirtualMachineInstance
  OfflineVirtualMachine ==> VirtualMachine

### 0.1.2 / 2018-05-25

* Collect vm status from kubevirt
* Fix resource_version naming

### 0.1.1 / 2018-05-22

* Move code from `manageiq-provider-kubevirt`.

### 0.1.0 / 2018-02-09

* Initial release of `fog-kubevirt` module. It provides basic `kubevirt`
  management capabilities.
