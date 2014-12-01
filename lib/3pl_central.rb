require "3pl_central/version"
require "3pl_central/configuration"
require "3pl_central/base"
require "3pl_central/client"
require "3pl_central/order"
require "3pl_central/services"
require "3pl_central/stock_status"
require "3pl_central/small_parcel_order"
module ThreePLCentral
  # Your code goes here...
end

## Object Extension

class Object
  def arrayify
    self.is_a?(Array) ? self : [self]
  end
end
## String Extension
class String
  def camelize
    self.split("_").each {|s| s.capitalize! }.join("")
  end
  # def camelize!
  #   self.replace(self.split("_").each {|s| s.capitalize! }.join(""))
  # end
  def underscore
    self.scan(/[A-Z][a-z]*/).join("_").downcase
  end
  # def underscore!
  #   self.replace(self.scan(/[A-Z][a-z]*/).join("_").downcase)
  # end

  def constantize
    Object.const_get(self)
  end
end
