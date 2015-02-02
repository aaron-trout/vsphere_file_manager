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
  [--overwrite], [--no-overwrite]

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
You first need to build the docker image, then you can use `docker run` and append your command
onto the end of the docker command.

Inside the container the script is linked as `/usr/local/bin/vsphere_file_manager` and also `/usr/local/bin/vfm` for convienience.

```
docker build --rm -t vs_fileman .

docker run --rm -it vs_fileman vfm [command] [options]
```

Example:

```
# Get help on a command
  docker run --rm -it vs_fileman vfm help upload
```
