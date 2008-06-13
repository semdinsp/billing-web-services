#!/usr/bin/ruby -w
#
# $Id: tc_currency,v 1.2 2004/07/08 08:38:44 ianmacd Exp $
#require 'net/http'
puts  "ENV is --------"
puts "#{$:}"
puts "--------------"
require 'rubygems'
gem 'stomp_message'
require 'stomp_message'

require File.dirname(__FILE__) + '/test_helper.rb'

#include BillingWebService

class BillingWebServiceTest < Test::Unit::TestCase
def setup
  puts 'in tcbilling setup'
  ar=BillingWebService::Argon::ArgonWebServiceClient.new('http://10.43.31.137:9999/cureWS/services?WSDL') #set test to defaults
  # ar.debug_wire   #wire debug  remove comment on if you want to debug the wire between services
  @test_msisdn = "639993130030"
  @test_account = "1000222"
end
@test_msisdn = ""
@test_account = ""
  def test_raw_object
    assert_instance_of( BillingWebService::BillingSystem,
		       bs= BillingWebService::BillingSystem.new )
	  m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                                     @test_msisdn,'get_account_details', 10)
    m2=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                                              @test_msisdn,'get_account_details', 10)
    m3=BillingWebService::BillingMessage.load_xml(m2.to_xml)
   assert m2.to_xml==m.to_xml, "xml wrong"
    assert m2.to_xml==m.to_xml, "xml wrong"
    m3=BillingWebService::BillingMessage.load_xml(m2.to_xml)
    assert m3.to_xml==m.to_xml, "xml wrong"
  end
  def test_get_account_number
    bs=BillingWebService::BillingSystem.new
    assert bs.get_account_number("1234")==nil, 'response not nil for 1234'
    assert bs.get_account_number("123")==nil, 'response not nil for 123'
    assert bs.get_account_number(@test_msisdn)==@test_account, "account not #{@test_account} for msisdn #{@test_msisdn}"
     second_account= bs.get_account_number('639993130313')
     puts "SECOND ACCOUNT #{second_account}"
      
  end
  def test_top_up
     bs=BillingWebService::BillingSystem.new
     #assert bs.get_account_number("1234")==nil, 'response not nill'
     acct=bs.get_account_number(@test_msisdn)
     assert acct==@test_account, "account not #{@test_account} for msisdn #{@test_msisdn}"
     assert bs.top_up(acct,500,"ruby_test_case"), 'top up not valid for proper account'
     assert !bs.top_up(123,500,"ruby_test_case"), 'top up  valid for invalid account'
     assert !bs.top_up(acct,-10,"ruby_test_case"), 'topup shoudl reject negative values'
   end
   def test_debit_account
       bs=BillingWebService::BillingSystem.new
       #assert bs.get_account_number("1234")==nil, 'response not nill'
       acct=bs.get_account_number(@test_msisdn)
       assert acct==@test_account, "account not #{@test_account} for msisdn #{@test_msisdn}"
       assert bs.debit_account(acct,-10,"ruby_test_case"), 'debit not valid for proper account'
        assert !bs.debit_account(123,-10,"ruby_test_case"), 'debit should rejet bd accounts'
       assert !bs.debit_account(acct,10,"ruby_test_case"), 'debit shoudl rejet positive values'
     end
     def test_pasaload
          bs=BillingWebService::BillingSystem.new
          #assert bs.get_account_number("1234")==nil, 'response not nill'
          assert bs.pasaload('639993130255','639993130259','3',"ruby_test_case"), 'pasaload not valid for proper accounts'
        end
        
        def test_load
              bs=BillingWebService::BillingSystem.new
              #assert bs.get_account_number("1234")==nil, 'response not nill'
              assert !bs.load('639993130030','95505095',"ruby_test_case"), 'load not valid for postpaid account'
              assert !bs.load('639993130255','95505095',"ruby_test_case"), 'load not valid for proper account and used PIN'
              assert !bs.load('639993130255','64896511',"ruby_test_case"), 'load not valid for proper account and used PIN'
              assert bs.load('639993130255','81981895',"ruby_test_case"), 'load not valid for proper account and used PIN'
            end
   def test_credit_limit
      bs=BillingWebService::BillingSystem.new
      #assert bs.get_account_number("1234")==nil, 'response not nill'
       acct=bs.get_account_number(@test_msisdn)
      assert acct==@test_account, "account not #{@test_account} for msisdn #{@test_msisdn}"
      assert bs.change_credit_limit(acct,500,"ruby_test_case"), 'change credit limit not valid for proper account'
      assert !bs.change_credit_limit(acct,-500,"ruby_test_case"), 'change credit limit valid for negative credit limit'
      assert !bs.change_credit_limit(123,500,"ruby_test_case"), 'change credit limit valid for invalid account'
    end
    
    def test_stomp_messaging
        args={}
        args[:topic] = '/topic/credit'
        bws=BillingWebService::BillingServer.new(args)
        bs_thread = Thread.new {
               bws.run }
        assert bws.topic=='/topic/credit', "topic not set properly"
          billing_sender=StompMessage::StompSendTopic.new(args)   
        m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                              @test_msisdn,'get_account_details', 10)

          # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
          # m=StompMessage::Message.new('stomp_BILLING', msg)
          headers={}
          headers[:msisdn] = @test_msisdn
           billing_sender.send_topic_acknowledge(m,headers )  { 
                          |msg|  puts 'in handle action block' 
                           puts "handle action block msg is #{msg.to_s}"
                           assert msg.include?(@test_account), "account number not in response"
                           }
                                  m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                             @test_msisdn,'debit_account', 10)

             # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
           # m=StompMessage::Message.new('stomp_BILLING', msg)
                         headers={}
                     headers[:msisdn] = @test_msisdn
            billing_sender.send_topic_acknowledge(m,headers )  { 
                   |msg|  puts 'in debit account action block bad value' 
                         # puts "handle action block msg is #{msg.to_s}"
                        assert msg.include?("false"), "false not in response"
                                    }
                                    
                                    m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                               @test_msisdn,'debit_account', -10)

               # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
             # m=StompMessage::Message.new('stomp_BILLING', msg)
                           headers={}
                       headers[:msisdn] = @test_msisdn
              billing_sender.send_topic_acknowledge(m,headers )  { 
                     |msg|  puts 'in debit account action block' 
                           # puts "handle action block msg is #{msg.to_s}"
                          assert msg.include?("true"), "true not in response"
                                      }
    end
    def test_debit
          args={}
          args[:topic] = '/topic/credit'
          bws=BillingWebService::BillingSendTopic.new(args)
          res=bws.debit('639993130030',20,'0')
          assert res, 'result from debit not valid'
    end
     def test_balance_inquiry
              bs=BillingWebService::BillingSystem.new
              #assert bs.get_account_number("1234")==nil, 'response not nill'
              assert bs.balance_inquiry('639993130255',"ruby_test_case"), 'balance enquiry returns bad stuff'
      end
     def test_stomp_debit
          args={}
          args[:topic] = '/topic/credit'
          bws=BillingWebService::BillingServer.new(args)
          bs_thread = Thread.new {
                 bws.run }
          assert bws.topic=='/topic/credit', "topic not set properly"
            billing_sender=StompMessage::StompSendTopic.new(args)                                               
            m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                               @test_msisdn,'debit_account', -10)

               # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
             # m=StompMessage::Message.new('stomp_BILLING', msg)
                           headers={}
                 #      headers[:msisdn] = @test_msisdn
                       flag=false
              billing_sender.send_topic_acknowledge(m,headers )  { 
                          |msg|  
                            puts "handle action block msg is #{msg.to_s}: classs #{msg.class}"
                          assert msg.body==true, "account not debitted"
                          flag=true
                                      }
                      sleep(5)
                      assert flag, "ack block was not called"
                                      
          end
           def test_stomp_usage
                args={}
                args[:topic] = '/topic/credit'
                bws=BillingWebService::BillingServer.new(args)
                bs_thread = Thread.new {
                       bws.run }
                assert bws.topic=='/topic/credit', "topic not set properly"
                  billing_sender=StompMessage::StompSendTopic.new(args)                                               
                  m=BillingWebService::BillingMessage.new("stomp_BILLING",'responsetopic', 
                                     @test_msisdn,'get_usage_details', -10)

                     # billing_sender.send_topic(m.body,  arg_hash[:msisdn]) 
                   # m=StompMessage::Message.new('stomp_BILLING', msg)
                                 headers={}
                             headers[:msisdn] = @test_msisdn
                             flag=false
                    billing_sender.send_topic_acknowledge(m,headers )  { 
                                |msg|  
                                 # puts "handle action block msg is #{msg.to_s}"
                                assert msg.body==true, "usage details not return"
                                flag=true
                                            }
                          sleep(5)
                            assert flag, "ack block was not called"

                end
                                    

end
