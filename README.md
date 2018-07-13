# Provisioner script with Vagrant profile for a Jenkins CI server

## Background

Vagrant and VirtualBox (or some other VM provider) can be used to quickly build or rebuild virtual servers.

This Vagrant profile installs [Jenkins](http://jenkins-ci.org/) (running on Java) using the one of the following technique for provisioners
- [Shell script] (https://tiswww.case.edu/php/chet/bash/bashref.html)
- TBD... [Ansible](http://www.ansible.com/).
- TBD... [Puppet] (https://puppet.com/)

## Getting Started

This README file is inside a folder that contains a `Vagrantfile` (hereafter this folder shall be called the [vagrant_root]), which tells Vagrant how to set up your virtual machine in VirtualBox.

To use the vagrant file, you will need to have done the following:

  1. Download and Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Download and Install [Vagrant](https://www.vagrantup.com/downloads.html)
  3. TBD...Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
  4. TBD...Install [Puppet](https://puppet.com/docs/pe/2018.1/installing.html)
  5. Open a shell prompt (Terminal app on a Mac) and cd into the folder containing the `Vagrantfile`


Once all of that is done, you can simply type in `vagrant up`, and Vagrant will create a new VM, install the base box, and configure it.

Once the new VM is up and running (after `vagrant up` is complete and you're back at the command prompt), you can log into it via SSH if you'd like by typing in `vagrant ssh`. Otherwise, the next steps are below.

## Objective
This script will install Jenkins (a Continious Integration Server) that run on port 8000, we will bypass the "Unlock Jenkins" page install with no jenkins security login mode.

## Author Information
Created in 2018 by [Dzuy Tran]
