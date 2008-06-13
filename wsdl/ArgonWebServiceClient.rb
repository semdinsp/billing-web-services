#!/usr/bin/env ruby
require 'defaultDriver.rb'

endpoint_url = ARGV.shift
obj = ArgonWebServicePortType.new(endpoint_url)

# run ruby with -d to see SOAP wiredumps.
obj.wiredump_dev = STDERR if $DEBUG

# SYNOPSIS
#   updateAccountCreditLimit(parameters)
#
# ARGS
#   parameters      UpdateAccountCreditLimit - {http://ws.argon.seer.com}updateAccountCreditLimit
#
# RETURNS
#   parameters      UpdateAccountCreditLimitResponse - {http://ws.argon.seer.com}updateAccountCreditLimitResponse
#
parameters = nil
puts obj.updateAccountCreditLimit(parameters)

# SYNOPSIS
#   getAccountNumber(parameters)
#
# ARGS
#   parameters      GetAccountNumber - {http://ws.argon.seer.com}getAccountNumber
#
# RETURNS
#   parameters      GetAccountNumberResponse - {http://ws.argon.seer.com}getAccountNumberResponse
#
parameters = nil
puts obj.getAccountNumber(parameters)

# SYNOPSIS
#   getAccountDetails(parameters)
#
# ARGS
#   parameters      GetAccountDetails - {http://ws.argon.seer.com}getAccountDetails
#
# RETURNS
#   parameters      GetAccountDetailsResponse - {http://ws.argon.seer.com}getAccountDetailsResponse
#
parameters = nil
puts obj.getAccountDetails(parameters)

# SYNOPSIS
#   topup(parameters)
#
# ARGS
#   parameters      Topup - {http://ws.argon.seer.com}topup
#
# RETURNS
#   parameters      TopupResponse - {http://ws.argon.seer.com}topupResponse
#
parameters = nil
puts obj.topup(parameters)


