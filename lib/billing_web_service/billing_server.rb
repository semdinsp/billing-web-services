require 'rubygems'
gem 'stomp'
require 'stomp'
require 'stomp'
gem 'stomp_message'
require 'stomp_message'
module BillingWebService
class BillingServer < StompMessage::StompServer
  
 # attr_accessor :bs
 
  def initialize(options={})
    super(options)
   # self.bs=BillingWebService::BillingSystem.new
    puts "#{self.class} finished initializing"
  end
  # def connect_topic
   #    self.conn.subscribe self.topic, { :ack =>"auto" }
  # end
  # name is message command
  @@TIMEOUT_VAL=20
  def deduct_value
  end
  def timeout_block
     result = "timeout_block: unknown error"
     begin
     Timeout::timeout(@@TIMEOUT_VAL) {
          self.guard.synchronize { result = yield }
      }
       rescue Timeout::Error
         result << "#{get_id}: " << 'Timeout calling billing system'
       rescue IOError => e
          puts "IO Error found, retry second attempt class: #{e.class} #{e.message}"
          result = second_attempt  { result = yield }
       end
      result
  end
  def second_attempt
     result2 = "second attempt timeout_block: unknown error"
     begin
     Timeout::timeout(@@TIMEOUT_VAL) {
          self.guard.synchronize { result2 = yield }
      }
       rescue Timeout::Error
         result2 << "#{get_id}: " << 'second attempt Timeout calling billing system'
       end
      result2
  end
  def topup(account,value,user)
       result = timeout_block {
             ad=self.variables[get_id][:bs].top_up(account,value,user)
              flag = "#{ad}"
               result="" << flag
        }
     
  end
  def debit_account(account,value,user)
       result = timeout_block  {ad=Thread.current[:bs].debit_account(account,value,user)
             flag = "#{ad}"
             result="" << flag}
   end
   def balance_inquiry(msisdn,user)
        result = timeout_block  {ad=self.variables[get_id][:bs].balance_inquiry(msisdn,user)
              flag = "#{ad}"
              result="" << flag}
    end
   def pasaload(src,dest,value,user)
      puts "PASALOAD"
         result = timeout_block  {ad=self.variables[get_id][:bs].pasaload(src,dest,value,user)
               flag = "#{ad}"
               result="" << flag}
     end
      def dealer_load(src,dest,value,user)
            result = timeout_block  {ad=self.variables[get_id][:bs].dealer_load(src,dest,value,user)
                  flag = "#{ad}"
                  result="" << flag}
        end
     def load(src,value,user)
           result = timeout_block  {ad=self.variables[get_id][:bs].load(src,value,user)
                 flag = "#{ad}"
                 result="" << flag}
       end
  def get_account_details(account)
     result = timeout_block {ad=self.variables[get_id][:bs].get_account_details(account)
      result=""
   #   result << " vTigerID: " << ad.vTigerID
      result <<  " accountNumber: " << ad.accountNumber
       result <<  " balance: " << ad.balance
       result <<  " creditLimit: " << ad.creditLimit
       result <<  " currentUsage: " << ad.currentUsage
       result <<  " imsi: " << ad.imsi
      result <<  " msisdn: " << ad.msisdn
      result <<  " productName: " << ad.productName
      result <<  " remarks: " << ad.remarks
      result <<  " status: " << ad.status
      puts result
      result}
  end
  # override this
   def stomp_DEBUG(msg,stomp_msg)
      @debug=!@debug
      puts "debug flag is now #{@debug}"
      self.variables[get_id][:bs].debug  #this will on do one thread...should do all.
      [false, '']
   end
  def get_usage_details(account)
      result = timeout_block {ad=self.variables[get_id][:bs].get_account_details(account)
       result=""
        bal=ad.balance.to_i
        usage=ad.currentUsage.to_i
        rem_credit =  ad.creditLimit.to_i - usage
       #  puts "balance: #{bal} "
       #  puts "usage: #{usage} "
         # result <<  "Your account is: " << account << "\n"
      #     result <<  " balance PhP #{bal} "
        result <<  " your remaining balance is  PhP #{rem_credit}. \n"
       puts result
       result}
   end
   def get_account_number(msisdn)    
         acct=''
         begin
         Timeout::timeout(@@TIMEOUT_VAL) {
              #puts "BUG: get account number #{msisdn}"
              self.guard.synchronize { acct=self.variables[get_id][:bs].get_account_number(msisdn) }
              #puts "BUG: get account number #{msisdn} acct: #{acct}"
          }
           rescue Timeout::Error
               puts  "#{get_id}:  Timeout calling billing system for get acct number"
           end
          acct 
   end
   def setup_thread_specific_items(mythread_number)
       super(mythread_number)
       puts " ---->creating billing system manager for #{get_id}"
        self.variables[get_id][:bs]= BillingWebService::BillingSystem.new
       puts " <--- billing system created"
     end
  def stomp_BILLING(msg, stomp_msg)
     # self.conn.acknowledge
      puts "in stomp Billing message" if @debug
      puts "#{get_id}: #{Time.now} INCOMING msg xml is #{msg.to_xml} body is #{stomp_msg.body}" if @debug
      m=BillingWebService::BillingMessage.load_xml(stomp_msg.body)
       
      exclude_list=%w(pasaload load dealer_load dispense_pin balance_inquiry)
      puts "m.action #{m.action} excude list #{exclude_list.to_s} include #{exclude_list.include? m.action}"   if @debug
      self.variables[get_id][:actt]='ZZ00' if exclude_list.include? m.action
      self.variables[get_id][:actt]=get_account_number(m.msisdn) if !exclude_list.include? m.action
      puts "account is #{Thread.current[:acct]} for #{m.msisdn}" if @debug
      a="unknown action"
      switch_action=m.action
       switch_action = "bad_msisdn" if self.variables[get_id][:actt]==nil || self.variables[get_id][:actt]==''
       case switch_action
        when   "get_account_details"
          a=get_account_details(self.variables[get_id][:actt])
        when   "pasaload"
            a=pasaload(m.src_msisdn,m.dest_msisdn,m.value,'user')
          when   "balance_inquiry"
              a=balance_inquiry(m.src_msisdn,'user')    
        when   "dealer_load"
           a=dealer_load(m.src_msisdn,m.dest_msisdn,m.value,'user')
        when   "load"
            a=load(m.msisdn,m.value,'user')
        when   "get_usage_details"
          a=get_usage_details(self.variables[get_id][:actt])
        when  "debit_account"
           a=debit_account(self.variables[get_id][:actt], m.value, 'user') 
        when  "topup"
            a=topup(self.variables[get_id][:actt], m.value, 'user')
        when "bad_msisdn"  
            a=" could not retrieve account information for #{m.msisdn}"
        else
            a= " invalid action received: #{switch_action}"
        end
            
      puts "#{get_id}: #{Time.now} REPLY before reply action: #{m.action} acct = #{self.variables[get_id][:actt]} a is #{a}"  
      reply_msg = StompMessage::Message.new('stomp_REPLY', "#{a}")
      [true,reply_msg]
      
    # self.conn.ack  stomp_msg.headers['message-id'], stomp_msg.headers
    
  end
  
end # billing server
end #module