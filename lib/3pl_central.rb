require "3pl_central/version"
require "3pl_central/core_extensions"
require "3pl_central/configuration"
require "3pl_central/base"
require "3pl_central/client"
require "3pl_central/order"
require "3pl_central/services"
require "3pl_central/stock_status"
require "3pl_central/small_parcel_order"
module ThreePLCentral; end

class Object
  def arrayify
    self.is_a?(Array) ? self : [self]
  end
end