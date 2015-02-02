#!/usr/bin/env ruby

require 'thor'
require 'rbvmomi'

class VsphereFileManager < Thor

  desc 'upload local_path remote_path', 'Upload a file to a datastore'
  method_option :datacenter, :required => true, :type => :string
  method_option :datastore, :required => true, :type => :string
  method_option :vcenter, :required => true, :type => :string
  method_option :username, :required => true, :type => :string
  method_option :password, :required => true, :type => :string
  method_option :insecure, :required => false, :type => :boolean, :default => false
  def upload(local_path, remote_path)
    vim = connect_vcenter options[:vcenter],
      options[:username],
      options[:password],
      options[:insecure]
    dc = vim.serviceInstance.find_datacenter(options[:datacenter])
    ds = dc.find_datastore(options[:datastore])
    raise 'Remote file already exists!' if ds.exists?(remote_path)
    ds.upload remote_path, local_path
  end

  desc 'download remote_path local_path', 'Download a file from a remote datastore'
  method_option :datacenter, :required => true, :type => :string
  method_option :datastore, :required => true, :type => :string
  method_option :vcenter, :required => true, :type => :string
  method_option :username, :required => true, :type => :string
  method_option :password, :required => true, :type => :string
  method_option :insecure, :required => false, :type => :boolean, :default => false
  def download(remote_path, local_path)
    vim = connect_vcenter options[:vcenter],
      options[:username],
      options[:password],
      options[:insecure]
    dc = vim.serviceInstance.find_datacenter(options[:datacenter])
    ds = dc.find_datastore(options[:datastore])
    raise 'Remote file does not exist!' if not ds.exists?(remote_path)
    ds.download remote_path, local_path
  end

  no_commands do
    def connect_vcenter(host, user, password, insecure)
      RbVmomi::VIM.connect host: host,
        user: user,
        password: password,
        insecure: insecure
    end
  end

end


VsphereFileManager.start
