require 'yaml'
require 'rubygems'
gem 'stomp'
require 'stomp'
gem 'stomp_message'
require 'stomp_message'
# This sends the sms to a activemq topic
module BillingWebService
class BillingSendTopic < StompMessage::StompSendTopic
  attr_accessor :result, :a_hash
  #need to define topic, host properly
  @@TOPIC='billing'

 def initialize(options={})
   # set up variables using hash
    options[:topic] =   options[:topic]==nil ? @@TOPIC : options[:topic]  
    super(options)
    a_hash=options
    self.result=false
  end
  def action(msisdn, value, type,arg_hash, tim=60, dest=0)
   # puts "BILLING ACTION"
        m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                                       msisdn,type, value,dest)

      # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
      # m=StompMessage::Message.new('stomp_BILLING', msg)
      #  billing_sender.setup_auto_close
       timeout=tim
       arg_hash= {} if arg_hash==nil
       result=''
        if @javaflag
          puts "sending jms message in billing action"
          result=self.jms_msg_result(m)
        else
        result=self.send_topic_ack(m,arg_hash,timeout)
         end
         puts " message billing action result is #{result}"
        result
  end

  def credit(msisdn,value, dest, headers={})
         action(msisdn,value,'topup',headers, 20)
  end
  def load(msisdn,value, dest, headers={})
        action(msisdn,value,'load',headers, 20,dest)       
  end #send_sms
  def dispense_pin(msisdn,value, dest, headers={})
        action(msisdn,value,'dispense_pin',headers, 20,dest)       
  end #send_sms
  def pasaload(msisdn,value, dest, headers={})
        action(msisdn,value,'pasaload',headers, 20,dest)       
  end #send_sms
  def dealer_load(msisdn,value, dest, headers={})
         action(msisdn,value,'dealer_load',headers, 20,dest)       
   end #send_sms
  def debit(msisdn,value, dest, headers={})
         action(msisdn,value,'debit_account',headers,20)
  end #send_sms
 
end #class
end #module