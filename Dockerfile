FROM ruby:latest
MAINTAINER Aaron Trout <aaron@trouter.co.uk>

RUN mkdir /root/vsphere_file_manager
WORKDIR /root/vsphere_file_manager

ADD Gemfile* ./
RUN bundle install

ADD vsphere_file_manager.rb ./
RUN ln -s /root/vsphere_file_manager.rb /bin/vsphere_file_manager
RUN ln -s /root/vsphere_file_manager.rb /bin/vfm
