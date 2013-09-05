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

**NOTE: So there appears to be an issue with setting the VAGRANT\_VAGRANTFILE
environmental variable - doing so mucks with the load path and Vagrant seems to
ignore the box-specific Vagrantfile it usually merges in from
`~/.vagrant.d/boxes/<BOXNAME>/<PROVIDER>/Vagrantfile`.  This causes a problem when that
Vagrantfile sets things like the `config.vm.base\_mac` parameter. The solution is to
either EXPLICITLY set those things in your alternative Vagrantfile, OR rename your
alternative Vagrantfile to `Vagrantfile` and just roll with it.**

## Getting Started with Vagrant

This talk was geared for an OS X-centric audience.  To get started, install the
[Vagrant installer package](http://downloads.vagrantup.com/) for the version
you mean to use, install any necessary plugins, and then go to town. For more
help, see the [Vagrant Documentation Site](http://docs.vagrantup.com).

## Vagrant Boxes used

All the Vagrant boxes I used in the talk can be found at the
[Puppetlabs Vagrant Boxes site](http://puppet-vagrant-boxes.puppetlabs.com).
I used the Centos boxes for the virtualbox and vmware\_fusion providers.

## Using the Puppet Provisioner

One of the Vagrantfiles uses Puppet to provision itself. I've copied a script
from the [Hashicorp bootstrap repo](https://github.com/hashicorp/puppet-bootstrap)
to make it easier for you, but you might want to check that repo out to make sure
the world hasn't moved since I committed it.

Also, there are a number of modules that you'll need in order to get my
Wordpress example to work.  Fortunately, I created a [wrapper `profiles` module](http://forge.puppetlabs.com/glarizza/profiles)
to make this process much easier for you.  Well, it's going to be easy IF
you already have Puppet installed since we'll need the `puppet module`
subcommand.  To install Puppet for Mac, download both Facter and Puppet
from the [Puppetlabs Mac Repository](https://downloads.puppetlabs.com/mac/)
and install it as you would install any package.

Once Puppet is installed, you can do the following (**ASSUMING you clone
this repository to a path like ~/src**)

        $ mkdir ~/src
        $ git clone https://github.com/glarizza/vagrants.git
        $ cd ~/src/vagrants/macsysadmin_demo
        $ mkdir modules
        $ puppet module install glarizza/profiles --target-dir modules

That will copy every necessary module to the `modules` directory that I
reference in the Vagrantfile and set it up so that everything will
'Just Work™' (you know...theoretically).
