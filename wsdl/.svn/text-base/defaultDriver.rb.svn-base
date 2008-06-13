require 'default.rb'
require 'defaultMappingRegistry.rb'
require 'soap/rpc/driver'

class ArgonWebServicePortType < ::SOAP::RPC::Driver
  DefaultEndpointUrl = "http://svbilling:9999/cureWS/services"

  Methods = [
    [ "",
      "updateAccountCreditLimit",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "updateAccountCreditLimit"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "updateAccountCreditLimitResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "",
      "getAccountNumber",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "getAccountNumber"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "getAccountNumberResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "",
      "getAccountDetails",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "getAccountDetails"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "getAccountDetailsResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ],
    [ "",
      "topup",
      [ ["in", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "topup"]],
        ["out", "parameters", ["::SOAP::SOAPElement", "http://ws.argon.seer.com", "topupResponse"]] ],
      { :request_style =>  :document, :request_use =>  :literal,
        :response_style => :document, :response_use => :literal }
    ]
  ]

  def initialize(endpoint_url = nil)
    endpoint_url ||= DefaultEndpointUrl
    super(endpoint_url, nil)
    self.mapping_registry = DefaultMappingRegistry::EncodedRegistry
    self.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
    init_methods
  end

private

  def init_methods
    Methods.each do |definitions|
      opt = definitions.last
      if opt[:request_style] == :document
        add_document_operation(*definitions)
      else
        add_rpc_operation(*definitions)
        qname = definitions[0]
        name = definitions[2]
        if qname.name != name and qname.name.capitalize == name.capitalize
          ::SOAP::Mapping.define_singleton_method(self, qname.name) do |*arg|
            __send__(name, *arg)
          end
        end
      end
    end
  end
end

