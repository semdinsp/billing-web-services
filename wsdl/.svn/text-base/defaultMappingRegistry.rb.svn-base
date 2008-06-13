require 'default.rb'
require 'soap/mapping'

module DefaultMappingRegistry
  EncodedRegistry = ::SOAP::Mapping::EncodedRegistry.new
  LiteralRegistry = ::SOAP::Mapping::LiteralRegistry.new

  EncodedRegistry.register(
    :class => AcknowledgementDTO,
    :schema_ns => "http://dto.components.argon.seer.com",
    :schema_type => "AcknowledgementDTO",
    :schema_element => [
      ["accountNumber", "SOAP::SOAPLong"],
      ["remarks", "SOAP::SOAPString"],
      ["successful", "SOAP::SOAPBoolean"]
    ]
  )

  EncodedRegistry.register(
    :class => AccountDTO,
    :schema_ns => "http://dto.components.argon.seer.com",
    :schema_type => "AccountDTO",
    :schema_element => [
      ["vTigerID", ["SOAP::SOAPString", XSD::QName.new("http://dto.components.argon.seer.com", "VTigerID")]],
      ["accountNumber", "SOAP::SOAPLong"],
      ["balance", "SOAP::SOAPDouble"],
      ["creditLimit", "SOAP::SOAPDouble"],
      ["currentUsage", "SOAP::SOAPDouble"],
      ["imsi", "SOAP::SOAPString"],
      ["msisdn", "SOAP::SOAPString"],
      ["productName", "SOAP::SOAPString"],
      ["remarks", "SOAP::SOAPString"],
      ["status", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => UpdateAccountCreditLimit,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "updateAccountCreditLimit",
    :schema_qualified => true,
    :schema_element => [
      ["in0", "SOAP::SOAPLong"],
      ["in1", "SOAP::SOAPDouble"],
      ["in2", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => UpdateAccountCreditLimitResponse,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "updateAccountCreditLimitResponse",
    :schema_qualified => true,
    :schema_element => [
      ["out", "AcknowledgementDTO"]
    ]
  )

  LiteralRegistry.register(
    :class => GetAccountNumber,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "getAccountNumber",
    :schema_qualified => true,
    :schema_element => [
      ["in0", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GetAccountNumberResponse,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "getAccountNumberResponse",
    :schema_qualified => true,
    :schema_element => [
      ["out", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => GetAccountDetails,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "getAccountDetails",
    :schema_qualified => true,
    :schema_element => [
      ["in0", "SOAP::SOAPLong"]
    ]
  )

  LiteralRegistry.register(
    :class => GetAccountDetailsResponse,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "getAccountDetailsResponse",
    :schema_qualified => true,
    :schema_element => [
      ["out", "AccountDTO"]
    ]
  )

  LiteralRegistry.register(
    :class => Topup,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "topup",
    :schema_qualified => true,
    :schema_element => [
      ["in0", "SOAP::SOAPLong"],
      ["in1", "SOAP::SOAPDouble"],
      ["in2", "SOAP::SOAPString"]
    ]
  )

  LiteralRegistry.register(
    :class => TopupResponse,
    :schema_ns => "http://ws.argon.seer.com",
    :schema_name => "topupResponse",
    :schema_qualified => true,
    :schema_element => [
      ["out", "AcknowledgementDTO"]
    ]
  )

  LiteralRegistry.register(
    :class => AcknowledgementDTO,
    :schema_ns => "http://dto.components.argon.seer.com",
    :schema_type => "AcknowledgementDTO",
    :schema_qualified => false,
    :schema_element => [
      ["accountNumber", "SOAP::SOAPLong"],
      ["remarks", "SOAP::SOAPString"],
      ["successful", "SOAP::SOAPBoolean"]
    ]
  )

  LiteralRegistry.register(
    :class => AccountDTO,
    :schema_ns => "http://dto.components.argon.seer.com",
    :schema_type => "AccountDTO",
    :schema_qualified => false,
    :schema_element => [
      ["vTigerID", ["SOAP::SOAPString", XSD::QName.new("http://dto.components.argon.seer.com", "VTigerID")]],
      ["accountNumber", "SOAP::SOAPLong"],
      ["balance", "SOAP::SOAPDouble"],
      ["creditLimit", "SOAP::SOAPDouble"],
      ["currentUsage", "SOAP::SOAPDouble"],
      ["imsi", "SOAP::SOAPString"],
      ["msisdn", "SOAP::SOAPString"],
      ["productName", "SOAP::SOAPString"],
      ["remarks", "SOAP::SOAPString"],
      ["status", "SOAP::SOAPString"]
    ]
  )
end
