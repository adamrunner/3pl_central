require "3pl_central/version"
require "3pl_central/configuration"
require "3pl_central/base"
require "3pl_central/client"
require "3pl_central/order"
require "3pl_central/services"
require "3pl_central/stock_status"
require "3pl_central/small_parcel_order"

begin
  require 'active_support/core_ext/string/inflections'
rescue LoadError; end

module ThreePLCentral
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
  end unless String.method_defined?(:camelize)
  # def camelize!
  #   self.replace(self.split("_").each {|s| s.capitalize! }.join(""))
  # end
  def underscore
    self.scan(/[A-Z][a-z]*/).join("_").downcase
  end unless String.method_defined?(:underscore)
  # def underscore!
  #   self.replace(self.scan(/[A-Z][a-z]*/).join("_").downcase)
  # end

  def constantize
    Object.const_get(self)
  end unless String.method_defined?(:constantize)
end
