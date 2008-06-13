#!/usr/bin/env ruby
# == Synopsis
#   bill topic action, send message to sdp for billing
# == Usage
#   Usage: billing_topic_action.rb -A  action -T topic -m msisdn     -d
# topic should be /topic/credit  action can be one of get_account_details, topup, debit_account, get_usage_details, pasaload, load dealer_load dispense_pin balance_inquiry
# == Useful commands
# billing_topic_action.rb -T billing -A get_account_details -m 639993130030
# billing_topic_action.rb -T billing -A balance_inquiry -m 639999999988
#  billing_topic_action.rb -T billing -A topup -m 639993130030 -v 10
# billing_topic_action.rb -T billing -A pasaload -m 639993130030 -v 3 -D 639993130030
# == Author
#   Scott Sproule  --- Ficonab.com (scott.sproule@ficonab.com)
# == Copyright
#    Copyright (c) 2007 Ficonab Pte. Ltd.
#     See license for license details
  
   require 'optparse'
   require 'rubygems'
   gem 'stomp_message'
   require 'stomp_message'
   require 'rdoc/usage'
require 'optparse'
  arg_hash=StompMessage::Options.parse_options(ARGV)
  flag =  arg_hash[:msisdn]!=nil || arg_hash[:account] != nil
  RDoc::usage if   !flag || arg_hash[:help]==true  || arg_hash[:topic]==nil
#gem 'soap4r'
#require 'soap4r'
gem 'billing_web_service'
require 'billing_web_service'

# @argontemp=BillingWebService::Argon::ArgonWebServiceClient.new('http://svbilling:9999/cureWS/services?wsdl')
#puts "ENV #{ENV}"
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"
   # puts "get account details"
  # begin
  #begin
     billing_sender=StompMessage::StompSendTopic.new(arg_hash)   
     m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                                     arg_hash[:msisdn],arg_hash[:action], arg_hash[:value], arg_hash[:destination])
    
    # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
    # m=StompMessage::Message.new('stomp_BILLING', msg)
      billing_sender.setup_auto_close if !billing_sender.java?
      msg_received_flag =false
     res=billing_sender.send_topic_ack(m, arg_hash, 30) 
     puts "result is #{res}"
  #   billing_sender.send_topic_jms_shutdown if billing_sender.java?
      billing_sender.send_topic_jms_shutdown
      exit!
  
