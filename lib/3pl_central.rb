require "3pl_central/version"
require "3pl_central/configuration"
require "3pl_central/base"
require "3pl_central/client"
require "3pl_central/order"
require "3pl_central/services"
require "3pl_central/stock_status"
require "3pl_central/small_parcel_order"
module ThreePLCentral

  class Object
    def arrayify
      self.is_a?(Array) ? self : [self]
    end
  end
  # Borrowed some implementations and conventions from Rails.
  class String
    def camelize
      self.split("_").each {|s| s.capitalize! }.join("")
    end

    def underscore
      self.scan(/[A-Z][a-z]*/).join("_").downcase
    end


    def constantize
      Object.const_get(self)
    end
  end
end