# vsphere_file_manager
Small CLI utility on top of rbvmomi to upload and download files to/from vcenter datastores

## Standard Installation

You will need bundler, if you don't already have that or know what it is then do:

`[sudo] gem install bundler`

Then run `bundle install` to install requirements.

## Usage

Uploading:

```
Usage:
  vsphere_file_manager.rb upload local_path remote_path --datacenter=DATACENTER --datastore=DATASTORE --password=PASSWORD --username=USERNAME --vcenter=VCENTER

Options:
  --datacenter=DATACENTER
  --datastore=DATASTORE
  --vcenter=VCENTER
  --username=USERNAME
  --password=PASSWORD
  [--insecure], [--no-insecure]

Upload a file to a datastore
```

Downloading:

```
Usage:
  vsphere_file_manager.rb download remote_path local_path --datacenter=DATACENTER --datastore=DATASTORE --password=PASSWORD --username=USERNAME --vcenter=VCENTER

Options:
  --datacenter=DATACENTER
  --datastore=DATASTORE
  --vcenter=VCENTER
  --username=USERNAME
  --password=PASSWORD
  [--insecure], [--no-insecure]

Download a file from a remote datastore
```

## Running with Docker

[COMING SOON!]
