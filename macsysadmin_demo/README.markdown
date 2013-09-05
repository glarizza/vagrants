## Macsysadmin Vagrant Demonstration

This repository was used for my talk on using Vagrant to stand up Linux
development environments entitled 'Your Little Linux Litterbox' for
[Macsysadmin 2013](http://www.macsysadmin.se) in Gothenburg, Sweden.

## How to use

There are multiple Vagrantfiles meant to be the separate steps in the demo
I was doing.  You can target each Vagrantfile by using the `VAGRANT_VAGRANTFILE`
environmental variable like so:

        $ VAGRANT_VAGRANTFILE=Vagrantfile.multiple_providers vagrant status

You can also uncomment the variable in the `environment_variables` file in the repo,
source it out, and then run Vagrant:

        <uncomment lines in the environment_variables file>
        $ source environment_variables
        $ vagrant status

## Getting Started with Vagrant

This talk was geared for an OS X-centric audience.  To get started, install the
[Vagrant installer package](http://downloads.vagrantup.com/) for the version
you mean to use, install any necessary plugins, and then go to town. For more
help, see the [Vagrant Documentation Site](http://docs.vagrantup.com).

## Vagrant Boxes used

All the Vagrant boxes I used in the talk can be found at the
[Puppetlabs Vagrant Boxes site](http://puppet-vagrant-boxes.puppetlabs.com).
I used the Centos boxes for the virtualbox and vmware\_fusion providers.

