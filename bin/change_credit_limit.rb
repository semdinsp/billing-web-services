#!/usr/bin/env ruby
if ARGV.size !=3
   puts "Usage: change_credit_limit.rb   account_num amount user "
   #def top_up(account_number,top_up_amount,user_name)
   puts "eg: get_account_number.rb 639893130045"
    puts "eg: change_credit_limit.rb 1003202 500 scott"
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
    puts "change_credit_limit"
     #begin
      bs=BillingWebService::BillingSystem.new
      account=ARGV[0].to_s
      puts "account #{account.inspect} frozen: #{account.frozen?}"
      #dup it to unfreeeze  :)
      new_credit_limit=ARGV[1].to_s
      user=ARGV[2].to_s
      res=bs.change_credit_limit(account.dup,new_credit_limit.dup,user.dup)
      puts "Account num: #{ARGV[0]} new credit limit : #{ARGV[1]} user: #{ARGV[2]} result: #{res}"
  # rescue Exception => e
   #   puts "exception found"
   #  puts "e.backtrace #{e.backtrace}"
   #end
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"   
  
