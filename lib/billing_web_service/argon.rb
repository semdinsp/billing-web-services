# $Id: finance.rb,v 1.8 2006/04/08 13:05:43 ianmacd Exp $
# 
# Author  : Scott Sproule scott.sproule@gmail.com
#
# Copyright (C) 2004-2006 Scott Sproule

require 'uri'
#require 'xsd/qname'
require 'soap/wsdlDriver'
require 'parsedate'
#require 'rubygems'
#gem 'jruby-openssl'
#require 'jruby-openssl'


module HTTPAccess2
   SSLEnabled =  false 
end

module BillingWebService
  require 'rubygems'
  gem 'httpclient'
  require 'httpclient'
 module Argon
   VERSION = '0.0.1'
   # WSDLtest	  = 'http://svbilling:9999/cureWS/services?wsdl'   #testing 9999  #production=8888
  # WSDLprod	  = 'http://svbilling:8888/cureWS/services?wsdl'   #testing 9999  #production=8888
   # ip address to remove dns  10.43.31.137
    WSDLtest	  = 'http://10.43.31.137:9999/cureWS/services?wsdl'   #testing 9999  #production=8888
    WSDLprod	  = 'http://10.43.31.137:8888/cureWS/services?wsdl'   #testing 9999  #production=8888
   # {http://ws.argon.seer.com}updateAccountCreditLimit
   # {http://ws.argon.seer.com}updateAccountCreditLimit
   # {http://ws.argon.seer.com}updateAccountCreditLimit
   class UpdateAccountCreditLimit
     attr_accessor :in0
     attr_accessor :in1
     attr_accessor :in2

     def initialize(in0 = nil, in1 = nil, in2 = nil)
       @in0 = in0
       @in1 = in1
       @in2 = in2
     end
   end

   # {http://ws.argon.seer.com}updateAccountCreditLimitResponse
   class UpdateAccountCreditLimitResponse
     attr_accessor :out

     def initialize(out = nil)
       @out = out
     end
   end
   # {http://ws.argon.seer.com}getAccountNumber
   class GetAccountNumber
     attr_accessor :in0

     def initialize(in0 = nil)
       @in0 = in0
     end
   end

   # {http://ws.argon.seer.com}getAccountNumberResponse
   class GetAccountNumberResponse
     attr_accessor :out

     def initialize(out = nil)
       @out = out
     end
   end

   # {http://ws.argon.seer.com}getAccountDetails
   class GetAccountDetails
     attr_accessor :in0

     def initialize(in0 = nil)
       @in0 = in0
     end
   end
   # {http://ws.argon.seer.com}getAccountDetailsResponse
   class GetAccountDetailsResponse
     attr_accessor :out

     def initialize(out = nil)
       @out = out
     end
   end

   # {http://ws.argon.seer.com}topup
   class Topup
     attr_accessor :in0
     attr_accessor :in1
     attr_accessor :in2

     def initialize(in0 = nil, in1 = nil, in2 = nil)
       @in0 = in0
       @in1 = in1
       @in2 = in2
     end
   end
   
   # {http://ws.argon.seer.com}topup
    class DebitAccount
      attr_accessor :in0
      attr_accessor :in1
      attr_accessor :in2

      def initialize(in0 = nil, in1 = nil, in2 = nil)
        @in0 = in0
        @in1 = in1
        @in2 = in2
      end
    end

  
   # {http://ws.argon.seer.com}topupResponse
   class TopupResponse
     attr_accessor :out

     def initialize(out = nil)
       @out = out
     end
   end
    class DebitAccountResponse
      attr_accessor :out

      def initialize(out = nil)
        @out = out
      end
    end

   # {http://dto.components.argon.seer.com}AcknowledgementDTO
   class AcknowledgementDTO
     attr_accessor :accountNumber
     attr_accessor :remarks
     attr_accessor :successful

     def initialize(accountNumber = nil, remarks = nil, successful = nil)
       @accountNumber = accountNumber
       @remarks = remarks
       @successful = successful
     end
   end

   # {http://dto.components.argon.seer.com}AccountDTO
   class AccountDTO
     attr_accessor :vTigerID
     attr_accessor :accountNumber
      attr_accessor :balance
       attr_accessor :creditLimit
       attr_accessor :currentUsage
       attr_accessor :imsi
       attr_accessor :msisdn
       attr_accessor :productName
       attr_accessor :remarks
       attr_accessor :status

       def initialize(vTigerID = nil, accountNumber = nil, balance = nil, creditLimit = nil, currentUsage = nil, imsi = nil, msisdn = nil, productName = nil, remarks = nil, status = nil)
         @vTigerID = vTigerID
         @accountNumber = accountNumber
         @balance = balance
         @creditLimit = creditLimit
         @currentUsage = currentUsage
         @imsi = imsi
         @msisdn = msisdn
         @productName = productName
         @remarks = remarks
         @status = status
       end
     end
     class ResponseDTO
       @@schema_type = "ResponseDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["code", "SOAP::SOAPString"], ["remarks", "SOAP::SOAPString"], ["result", "SOAP::SOAPString"]]

       attr_accessor :code
       attr_accessor :remarks
       attr_accessor :result

       def initialize(code = nil, remarks = nil, result = nil)
         @code = code
         @remarks = remarks
         @result = result
       end
     end
     class BigDecimailResponseDTO
        @@schema_type = "BigDecimalResponseDTO"
        @@schema_ns = "http://dto.components.argon.seer.com"
        @@schema_element = [["bigDecimalResult", "SOAP::SOAPString"], ["code", "SOAP::SOAPString"], ["remarks", "SOAP::SOAPString"], ["result", "SOAP::SOAPString"]]

        attr_accessor :bigDecimalResult
        attr_accessor :code
        attr_accessor :remarks
        attr_accessor :result

        def initialize(bigDecimalResult = nil, code = nil, remarks = nil, result = nil)
          @bigDecimalResult = bigDecimalResult
          @code = code
          @remarks = remarks
          @result = result
        end
      end
     class AutoLoad
       @@schema_type = "autoLoad"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPString"], ["in1", "SOAP::SOAPString"], ["in2", "SOAP::SOAPDouble"], ["in3", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1
       attr_accessor :in2
       attr_accessor :in3

       def initialize(in0 = nil, in1 = nil, in2 = nil, in3 = nil)
         @in0 = in0
         @in1 = in1
         @in2 = in2
         @in3 = in3
       end
     end

     # {http://ws.argon.seer.com}autoLoadResponse
     class AutoLoadResponse
       @@schema_type = "autoLoadResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "ResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end

     # {http://ws.argon.seer.com}availableDenominations
     class AvailableDenominations
       @@schema_type = "availableDenominations"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPLong"], ["in1", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1

       def initialize(in0 = nil, in1 = nil)
         @in0 = in0
         @in1 = in1
       end
     end

     # {http://ws.argon.seer.com}availableDenominationsResponse
     class AvailableDenominationsResponse
       @@schema_type = "availableDenominationsResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "AvailableDenominationsResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end

     # {http://ws.argon.seer.com}load
     class Load
       @@schema_type = "load"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPString"], ["in1", "SOAP::SOAPString"], ["in2", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1
       attr_accessor :in2

       def initialize(in0 = nil, in1 = nil, in2 = nil)
         @in0 = in0
         @in1 = in1
         @in2 = in2
       end
     end

     # {http://ws.argon.seer.com}loadResponse
     class LoadResponse
       @@schema_type = "loadResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "BigDecimalResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end

     # {http://ws.argon.seer.com}dispensePin
     class DispensePin
       @@schema_type = "dispensePin"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPInt"], ["in1", "SOAP::SOAPInt"], ["in2", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1
       attr_accessor :in2

       def initialize(in0 = nil, in1 = nil, in2 = nil)
         @in0 = in0
         @in1 = in1
         @in2 = in2
       end
     end

     # {http://ws.argon.seer.com}dispensePinResponse
     class DispensePinResponse
       @@schema_type = "dispensePinResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "ResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end
     class BalanceInquiry
       @@schema_type = "balanceInquiry"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPString"], ["in1", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1

       def initialize(in0 = nil, in1 = nil)
         @in0 = in0
         @in1 = in1
       end
     end

     # {http://ws.argon.seer.com}balanceInquiryResponse
     class BalanceInquiryResponse
       @@schema_type = "balanceInquiryResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "BalanceInquiryResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end
     
     # {http://ws.argon.seer.com}pasaLoad
     class PasaLoad
       @@schema_type = "pasaLoad"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["in0", "SOAP::SOAPString"], ["in1", "SOAP::SOAPString"], ["in2", "SOAP::SOAPDouble"], ["in3", "SOAP::SOAPString"]]

       attr_accessor :in0
       attr_accessor :in1
       attr_accessor :in2
       attr_accessor :in3

       def initialize(in0 = nil, in1 = nil, in2 = nil, in3 = nil)
         @in0 = in0
         @in1 = in1
         @in2 = in2
         @in3 = in3
       end
     end

     # {http://ws.argon.seer.com}pasaLoadResponse
     class PasaLoadResponse
       @@schema_type = "pasaLoadResponse"
       @@schema_ns = "http://ws.argon.seer.com"
       @@schema_qualified = "true"
       @@schema_element = [["out", "ResponseDTO"]]

       attr_accessor :out

       def initialize(out = nil)
         @out = out
       end
     end
     
     class AvailableDenominationsResponseDTO
       @@schema_type = "AvailableDenominationsResponseDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["code", "SOAP::SOAPString"], ["denominations", "ArrayOfDenominationDTO"], ["remarks", "SOAP::SOAPString"], ["result", "SOAP::SOAPString"]]

       attr_accessor :code
       attr_accessor :denominations
       attr_accessor :remarks
       attr_accessor :result

       def initialize(code = nil, denominations = nil, remarks = nil, result = nil)
         @code = code
         @denominations = denominations
         @remarks = remarks
         @result = result
       end
     end

     # {http://dto.components.argon.seer.com}ArrayOfDenominationDTO
     class ArrayOfDenominationDTO < ::Array
       @@schema_type = "DenominationDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["DenominationDTO", ["DenominationDTO[]", XSD::QName.new("http://dto.components.argon.seer.com", "DenominationDTO")]]]
     end

     # {http://dto.components.argon.seer.com}DenominationDTO
     class DenominationDTO
       @@schema_type = "DenominationDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["denomination", "SOAP::SOAPInt"], ["pins", "SOAP::SOAPInt"]]

       attr_accessor :denomination
       attr_accessor :pins

       def initialize(denomination = nil, pins = nil)
         @denomination = denomination
         @pins = pins
       end
     end
 
     # {http://dto.components.argon.seer.com}BalanceInquiryResponseDTO
     class BalanceInquiryResponseDTO
       @@schema_type = "BalanceInquiryResponseDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["bucketList", "ArrayOfBucketDTO"], ["code", "SOAP::SOAPString"], ["remarks", "SOAP::SOAPString"], ["result", "SOAP::SOAPString"]]

       attr_accessor :bucketList
       attr_accessor :code
       attr_accessor :remarks
       attr_accessor :result

       def initialize(bucketList = nil, code = nil, remarks = nil, result = nil)
         @bucketList = bucketList
         @code = code
         @remarks = remarks
         @result = result
       end
     end
     
     # {http://dto.components.argon.seer.com}ArrayOfBucketDTO
     class ArrayOfBucketDTO < ::Array
       @@schema_type = "BucketDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["BucketDTO", ["BucketDTO[]", XSD::QName.new("http://dto.components.argon.seer.com", "BucketDTO")]]]
     end

     # {http://dto.components.argon.seer.com}BucketDTO
     class BucketDTO
       @@schema_type = "BucketDTO"
       @@schema_ns = "http://dto.components.argon.seer.com"
       @@schema_element = [["bucket", "SOAP::SOAPString"], ["denomination", "SOAP::SOAPDecimal"], ["validity", "SOAP::SOAPDateTime"]]

       attr_accessor :bucket
       attr_accessor :denomination
       attr_accessor :validity

       def initialize(bucket = nil, denomination = nil, validity = nil)
         @bucket = bucket
         @denomination = denomination
         @validity = validity
       end
     end  
  class ResultCode
    attr_accessor :code, :human_result, :status
    attr_accessor :result
    def initialize(code, string_val)
      self.code=code                                                 
      self.status  = code == "0" || code == '0000000000'  || code == '00000000000000000000'
      self.human_result= status ? string_val : get_human(code,string_val) 
      self.result = [self.status.to_s, "#{self.human_result}"]
      puts "REsult code #{self.code} init finished string #{string_val} result #{self.result.join(',')} "
    end
    
    #value needs to be only 1xxxx
    def get_human(invalue,string_val)
      res= ''
      value=invalue.to_s
        # when '1000000000' 	
      # res <<  ' ; failure in procedure' if  value[0]==49
       #  when '100000000'
        res << 	' Invalid/ inactive pin' if  value[1]==49 
       # when '10000000'
        res << 	' umobile e pin already used, do not use again to prevent account blocking' if  value[2]==49 
       #  when '1000000'
          res << ' pin already expired' if  value[3]==49
        # when '100000'	
          res <<  ' invalid account for sender' if  value[4]==49
       #  when '10000'	
           res << ' invalid account for receiver' if  value[5]==49
       #  when '1000'
           res <<  ' invalid transaction   (dealer-retailer or retailer-subscriber for autoload and subscriber-subscriber for pasaload)' if  value[6]==49
       #  when '100'
           res << ' Insufficient load/load expired. Please reload soon' if  value[7]==49 
       #  when '10'
           res << 	' No available pin for denomination' if  value[8]==49
       #  when '1'
           res << 	' No available denomination_type for amount' if  value[9]==49
      res
    end
    
  end  
  
  class ArgonWebServiceClient
    @soap=nil
    def initialize(wsdl= WSDLprod )
    #  wsdl=WSDLtest  # comment out later
      puts "--> argon intialize"
      temp = SOAP::WSDLDriverFactory.new(wsdl)
      puts "--  after wsdl factor"
      @soap = temp.create_rpc_driver if @soap==nil
      puts "<--- finished init...and soap defined."
  #     @@soap = SOAP::WSDLDriverFactory.new(wsdl).create_rpc_driver unless defined? @@soap  
      
    end
    include ParseDate
    #show the http requests... call this before making call
    def debug_wire
        @soap.wiredump_dev = STDERR 
    end
    def get_soap
      @soap
    end
    def dispense_pin(dealer_id,denom,user_name)
       pr=DispenseRin.new(dealer_id,denom,user_name)
       r = @soap.dispensePin(pr)
       resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
       # raise "bad AccountNumber" if resp.accountNumber != account_number
     #  puts "load resp is #{resp} inspect #{resp.inspect}"
        puts "dispense pin resp.code is #{resp.code} response.remarks #{resp.remarks.inspect} resp.result #{resp.result.inspect}"    
       # return  "#{resp.code == "0"} #{resp.result}"
        ResultCode.new(resp.code,resp.result).result
     end
     def balance_inquiry(msisdn,user_name)
       # puts 'ARGON balance inquiry'
        ld=BalanceInquiry.new(msisdn,user_name)
        r = @soap.balanceInquiry(ld)
        resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
        bucket_list={}
        # puts "BALANCE---->  bucketList #{resp.bucketList.inspect}"
        code = resp.code
        code = resp.code[0] if resp.code.is_a?(Array)
        flag =  code == "0000000000" # || resp.code.to_s == '00000000000000000000'
         value = "--->SOAP return is: #{code} flag is: #{flag}"
        # puts value
        
         if flag
                 #  puts 'in if loop'             
          #ORIGINAL  temp_array = resp.bucketList.bucketDTO
           temp_array = resp.bucketList.bucketDTO  #before [0]
           #   puts  " array  #{temp_array.inspect}"
          
            value=""
            total=0
           # puts "temp array: #{temp_array.to_s}"
            #OIGINAL DID NOT HAVE ARRAY
            postpaid_flag=false
            temp_array.each {|bucket|   # puts "bucket iterator is #{bucket.inspect}"
                                bucket_value = bucket.denomination   # [0]
                                bucket_name =bucket.bucket # [0]
                                bucket_list[bucket_name]=bucket_value
                        #       puts "bucket #{bucket_name} denom: #{bucket_value}"
                               total += bucket_value.to_i
                               postpaid_flag=true if bucket_name.to_s=='Current'
                               value << bucket_name.to_s + " " + bucket_value.to_s 
                               # should in check include?
                               buckflag= bucket_name=='SPECIAL' || bucket_name == 'Regular Load' || bucket_name =='REBATE' || bucket_name =='Free' || bucket_name=='Special'
                               if buckflag && bucket_value.to_i >0
                                  validtemp = parsedate(bucket.validity)   #[0]
                                  validtil=Time.local(*validtemp).strftime('%b %d')
                               value <<  " valid until: "  + validtil.to_s  
                                end   # if
                               value << "; "   
                                    }
            puts "---- res #{resp.code} bucket_list #{bucket_list.inspect}"
         end
      #   value="SPECIAL #{bucket_list['SPECIAL']} REGULAR #{bucket_list['REGULAR']}"
           account_type = postpaid_flag ? 'postpaid' : 'prepaid'
           value = "Your total #{account_type} account balance is #{total.to_i} and your breakdown is as follows " + value
           ResultCode.new(code,value).result
         #return "#{resp.code == "0000000000"} '#{value}'"
      end
    def load(msisdn,pin,user_name)
       ld=Load.new(msisdn,pin,user_name)
       r = @soap.load(ld)
       resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
       # raise "bad AccountNumber" if resp.accountNumber != account_number
     #  puts "load resp is #{resp} inspect #{resp.inspect}"
        puts "load resp.code is #{resp.code}  response.loadvalue: #{resp.bigDecimalResult} response.remarks #{resp.remarks.inspect} resp.result #{resp.result.inspect}"
         ResultCode.new(resp.code,resp.bigDecimalResult).result
       # return "#{resp.code == "0"} #{resp.bigDecimalResult} #{resp.code}"
     end
    def pasaload(from_msisdn,to_msisdn,amount,user_name)
       pl=PasaLoad.new(from_msisdn,to_msisdn,amount,user_name)
       r = @soap.pasaLoad(pl)
       resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
       # raise "bad AccountNumber" if resp.accountNumber != account_number
        puts "pasaload resp.code is #{resp.code} response.remarks #{resp.remarks.inspect} resp.result #{resp.result.inspect}"
         ResultCode.new(resp.code,'nothing').result
       # return resp.code == "0"
     end    
     
     def dealer_load(from_msisdn,to_msisdn,amount,user_name)
        al=AutoLoad.new(from_msisdn,to_msisdn,amount,user_name)
        r = @soap.autoLoad(al)
        resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
        # raise "bad AccountNumber" if resp.accountNumber != account_number
         puts "dealerload resp.code is #{resp.code} response.remarks #{resp.remarks.inspect} resp.result #{resp.result.inspect}"
          ResultCode.new(resp.code,'nothing').result
        # return resp.code == "0"
      end
     def top_up(account_number,top_up_amount,user_name)
        tu=Topup.new(account_number,top_up_amount,user_name)
        r = @soap.topup(tu)
        resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
        # raise "bad AccountNumber" if resp.accountNumber != account_number
         return r.out.successful == "true"
      end
       def debit_account(account_number,debit_amount,user_name)
          da=DebitAccount.new(account_number,debit_amount,user_name)
          r = @soap.debitAccount(da)
          resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
          
          # raise "bad AccountNumber" if resp.accountNumber != account_number
           return r.out.successful == "true"
        end
        def get_account_details(account_number)
            ad=GetAccountDetails.new(account_number)
            r = @soap.getAccountDetails(ad)
            
            resp=r.out  
              #resp.successful string, resp.remarks, resp.accountNumber
            # raise "bad AccountNumber" if resp.accountNumber != account_number
             return r.out
          end
        def change_credit_limit(account_number,credit_limit,user_name)
            cl=UpdateAccountCreditLimit.new(account_number,credit_limit,user_name)
            r = @soap.updateAccountCreditLimit(cl)
            resp=r.out    #resp.successful string, resp.remarks, resp.accountNumber
            # raise "bad AccountNumber" if resp.accountNumber != account_number
             return r.out.successful == "true"
          end
    def getAccountNumber(msisdn)
      ga=GetAccountNumber.new(msisdn)
      r = @soap.getAccountNumber(ga)
      #puts "SCOTT r.out #{r.out.to_s}"
     #   r.out if r.class == GetAccountNumberResponse
      #puts "r.out is #{r.out}"
      r.out if r.out.class == String
    end
  end
  end  
 end
