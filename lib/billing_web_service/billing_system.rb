# $Id: finance.rb,v 1.8 2006/04/08 13:05:43 ianmacd Exp $
# 
# Author  : Scott Sproule scott.sproule@gmail.com
#
# Copyright (C) 2004-2006 Scott Sproule
require 'yaml'

module BillingWebService
 class BillingSystem
  def initialize
    @argon=BillingWebService::Argon::ArgonWebServiceClient.new
  end
  def change_credit_limit(account_number,credit_limit,user_name)
     res=@argon.change_credit_limit(account_number,credit_limit,user_name)
     puts "in change credit limit: #{account_number} credit_limit: #{credit_limit} user: #{user_name} res: #{res}" 
     res
  end
  def debug
    @argon.debug_wire
    puts 'putting wire line debugging on'
  end
  def dispense_pin(dealer_id,denom,user_name)
     res=@argon.dispense_pin(dealer_id,denom,user_name)
     puts "in dispense pin up: #{dealer_id} denomination: #{denom} user: #{user_name} res: #{res}" 
     res.to_yaml
  end
  def balance_inquiry(msisdn,user_name)
     res=@argon.balance_inquiry(msisdn, user_name)
     puts "in balance inquiry msisdn : #{msisdn}  user: #{user_name} res: #{res}" 
     res.to_yaml
  end
  def dealer_load(from_msisdn,to_msisdn,amount,user_name)
     res=@argon.dealer_load(from_msisdn,to_msisdn,amount,user_name)
     puts "in dealer_load: #{from_msisdn} to: #{to_msisdn} amt: #{amount} user: #{user_name} res: #{res}" 
     res.to_yaml
  end
  def top_up(account_number,top_up_amount,user_name)
     res=@argon.top_up(account_number,top_up_amount,user_name)
     puts "in top up: #{account_number} top: #{top_up_amount} user: #{user_name} res: #{res}" 
     res
  end
  def load(msisdn,pin,user_name)
      res=@argon.load(msisdn,pin,user_name)
      puts "in load: #{msisdn} pin: #{pin} user: #{user_name} res: #{res}" 
      res.to_yaml
   end
  def pasaload(from_msisdn,to_msisdn,amount,user_name)
     res=@argon.pasaload(from_msisdn,to_msisdn,amount,user_name)
     puts "in pasaload: #{from_msisdn} to: #{to_msisdn} amt: #{amount} user: #{user_name} res: #{res}" 
     res.to_yaml
  end
  def debit_account(account_number,debit_amount,user_name)
      res=@argon.debit_account(account_number,debit_amount,user_name)
      puts "in debit account: #{account_number} debit: #{debit_amount} user: #{user_name} res: #{res}" 
      res
   end
  def get_account_number(msisdn)
    puts "in get_account number for: #{msisdn}" 
    account_number=@argon.getAccountNumber(msisdn)
    puts "MSDISN: #{msisdn} Account number is #{account_number}"
    account_number
  end
  def get_account_details(account_number)
    puts "in get_account details for: #{account_number}" 
    account_details=@argon.get_account_details(account_number)
    puts "Account number is #{account_number}"
    account_details
  end
 end
   
end
