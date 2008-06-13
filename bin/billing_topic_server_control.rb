#!/usr/bin/env ruby
require 'optparse'
require 'rubygems'
gem 'billing_web_service'
require 'billing_web_service'
gem 'daemons'
require 'daemons'
 puts "#{ARGV[0]} Billing Topic server: (need to be root)"
  #  begin
  options = {
  #  :ontop => true,
  #  :multiple => true,
    :monitor => true
    
  }
     Daemons.run(File.join(File.dirname(__FILE__), 'billing_topic_server.rb'), options)
     
        

   
    
