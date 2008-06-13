#!/usr/bin/env ruby
# Usage 
# jruby -S billing_topic_server.rb -T topic
require 'optparse'
gem 'billing_web_service'
require 'billing_web_service'
require 'rdoc/usage'
require 'java'
include StompMessage::JmsTools
 # env_setting = ARGV[1] || "production"
 #   path_setting = ARGV[0] || "/opt/local/rails_apps/subscriptions/current/"
  arg_hash=StompMessage::Options.parse_options(ARGV)
  RDoc::usage if  arg_hash[:help]==true
 require 'pp'
   options = arg_hash

    # set up variables using hash
     topic=arg_hash[:topic]  || 'billing'
    jms_start("TopicConnectionFactory")
    jms_set_debug(arg_hash[:debug])
    tdest, tconn= jms_create_destination_connection( topic)
    tproducer, tsession= jms_create_producer_session(tdest,tconn)
    tconsumer, consumer_session = jms_create_consumer_session(tdest,tconn) 
    
  #  begin
     
      s=BillingWebService::BillingServer.new({:topic => "#{topic}", :standalone => 'true', :jms_source => 'bwsserver'})
          tlistener=StompMessage::MySpecialListener.new(s)
       
        tconsumer.setMessageListener(tlistener)
  #    BillingWebService::BillingServer.new({:topic => '/topic/credit', :thread_count => '5'}).run
   #   sms_listener.join
   # rescue Exception => e
   #   puts "exception found #{e.backtrace}" 
  #  end
   
    
