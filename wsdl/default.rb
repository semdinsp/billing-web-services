require 'xsd/qname'

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

# {http://ws.argon.seer.com}topupResponse
class TopupResponse
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
