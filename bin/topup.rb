#!/usr/bin/env ruby
if ARGV.size !=3
   puts "Usage: topup.rb   account_num amount user "
   #def top_up(account_number,top_up_amount,user_name)
   puts "eg: get_account_number.rb 639893130045"
    puts "eg: topup.rb 1003202 500 scott"
   exit
end

require 'rubygems'
#gem 'soap4r'
#require 'soap4r'
gem 'billing_web_service'
require 'billing_web_service'

# @argontemp=BillingWebService::Argon::ArgonWebServiceClient.new('http://svbilling:9999/cureWS/services?wsdl')
#puts "ENV #{ENV}"
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"
    puts "top up account "
     #begin
      bs=BillingWebService::BillingSystem.new
      account=ARGV[0]
      amount=ARGV[1]
      user=ARGV[2]
      res=bs.top_up(account,amount,user)
      puts "Account num: #{ARGV[0]} value : #{ARGV[1]} user: #{ARGV[2]} result: #{res}"
  # rescue Exception => e
   #   puts "exception found"
   #  puts "e.backtrace #{e.backtrace}"
   #end
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"   
  
