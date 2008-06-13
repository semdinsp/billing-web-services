# basic format for stomp messages
require 'rexml/document'
require 'rubygems'
gem 'stomp_message'
require 'stomp_message'
module BillingWebService
	class BillingMessage < StompMessage::Message
	  attr_accessor :response_topic, :src_msisdn, :dest_msisdn, :action, :value
	  def initialize(cmd, response,src_dn,action, value, dest_dn=0)
	    self.action = action
	    self.src_msisdn = src_dn
      self.dest_msisdn = dest_dn
	    self.response_topic = response
	    self.value=value
	     #super(cmd,body_to_xml)
	      super(cmd)
	  end
	  def msisdn
	    self.src_msisdn
    end
	#  def body_to_xml
	 #     msg_xml = REXML::Element.new 'billing_message'
  #      msg_xml =self.add_elements(msg_xml)
   #     msg_xml.to_s
   # end
    def self.load_xml(body)
      doc=REXML::Document.new(body)
      dn=REXML::XPath.first(doc, "//src_msisdn").text
        dest_dn=REXML::XPath.first(doc, "//dest_msisdn").text
      action=REXML::XPath.first(doc, "//action").text
      value=REXML::XPath.first(doc, "//value").text
      topic=REXML::XPath.first(doc, "//response_topic").text
        cmd = REXML::XPath.first(doc, "//__stomp_msg_command").text
      sms=BillingWebService::BillingMessage.new(cmd,topic,dn,action,value,dest_dn)
    end
	end
end