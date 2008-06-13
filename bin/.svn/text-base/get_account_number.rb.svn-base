#!/usr/bin/env ruby
require 'optparse'
def usage
   puts "Usage: get_account_number.rb  -m msisdn "
   puts "eg: get_account_number.rb -m 639993130045"
   puts "add flag --debug or -d for debug"
   exit
end
def parse_options(params)
   opts = OptionParser.new
   puts "argv are #{params}"
   #params_split = params.split(' ')
   #puts "paramsp is #{paramsp}"
   usage_flag_and_exit=true
   temp_hash = {}
   opts.on("-d","--debug") {|val|  temp_hash[:debug ] = val 
                            puts "debug is true"}
   opts.on("-m","--msisdn VAL", String) {|val|  temp_hash[:msisdn ] = val
                                          puts "msiddn is #{val}"
                                          usage_flag_and_exit=false }
   #opts.on("-d","--database VAL", String) {|val|  temp_hash[:db ] = val }
   #opts.on("-p","--password VAL", String) {|val|  temp_hash[:password ] = val }
   #opts.on("-u","--user VAL", String) {|val|  temp_hash[:user ] = val }
   #puts " in test commander option parse #{port} #{url}"
   opts.parse(params)
   # puts " in HTTP #{hostname} port #{port} url: #{url}"
   usage if usage_flag_and_exit
   return temp_hash
 end
 arg_hash=parse_options(ARGV)
  


require 'rubygems'
#gem 'soap4r'
#require 'soap4r'
gem 'billing_web_service'
require 'billing_web_service'

# @argontemp=BillingWebService::Argon::ArgonWebServiceClient.new('http://svbilling:9999/cureWS/services?wsdl')
#puts "ENV #{ENV}"
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"
    puts "get account numbers"
   begin
      msisdn=arg_hash[:msisdn]
      bs=BillingWebService::BillingSystem.new
      bs.debug if arg_hash[:debug]==true
      
      acct=bs.get_account_number(msisdn)
      puts "MSISDN: #{msisdn} Account number: #{acct}"
   rescue Exception => e
      puts "exception found"
     puts "e.backtrace #{e.backtrace}"
   end
#puts "Argv is: #{ARGV}  argv.size is #{ARGV.size}"   
  
