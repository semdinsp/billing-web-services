#!/usr/bin/env ruby
# == Synopsis
#   get account details
# == Usage
#   get_account_details.rb -a account_number -m msisdn
# == Useful commands
# get_account_details.rb -a 1003202
# get_account_details.rb -m 639993130030
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

    arg_hash=StompMessage::Options.parse_options(ARGV)
    flag =  arg_hash[:msisdn]!=nil || arg_hash[:account] != nil
    RDoc::usage if   !flag || arg_hash[:help]==true


require 'pp'
#gem 'soap4r'
#require 'soap4r'
gem 'billing_web_service'
require 'billing_web_service'

# @argontemp=BillingWebService::Argon::ArgonWebServiceClient.new('http://svbilling:9999/cureWS/services?wsdl')
#puts "ENV #{ENV}"
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"
    puts "get account details"
  # begin
      account=arg_hash[:account]
      bs=BillingWebService::BillingSystem.new
      acct=bs.get_account_number(arg_hash[:msisdn]) if account==nil
      account=acct
      bs.debug if arg_hash[:debug]==true
      puts "Getting account details for account: #{account}"
      ad=bs.get_account_details(account)
      puts "vTigerID: " << ad.vTigerID
      puts  "accountNumber: " << ad.accountNumber
       puts  "balance: " << ad.balance
       puts  "creditLimit: " << ad.creditLimit
       puts  "currentUsage: " << ad.currentUsage
       puts  "imsi: " << ad.imsi
      puts  "msisdn: " << ad.msisdn
      puts  "productName: " << ad.productName
      puts  "remarks: " << ad.remarks
      puts  "status: " << ad.status 
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"   
  
