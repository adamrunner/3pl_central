module ThreePLCentral
  class Services
    class << self
      def create_orders(data)
        ThreePLCentral.client.call(:create_orders, message:data)
      end

      def find_orders(data)
        ThreePLCentral.client.call(:find_orders, message:data)
      end

      def stock_status(data)
        ThreePLCentral.client.call(:report_stock_status, message:data)
      end

      def small_parcel_orders(data)
        ThreePLCentral.client.call(:small_parcel_orders, message:data)
      end
    end
  end
end
