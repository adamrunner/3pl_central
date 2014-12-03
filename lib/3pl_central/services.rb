module ThreePLCentral
  class Services
    class << self
      def create_orders(data)
        ThreePLCentral.client.request(:create_orders) do
          soap.body = data
        end
      end

      def find_orders(data)
        ThreePLCentral.client.request(:find_orders) do
          soap.body = data
        end
      end

      def stock_status(data)
        ThreePLCentral.client.request(:report_stock_status) do
          soap.body = data
        end
      end

      def small_parcel_orders(data)
        ThreePLCentral.client.request(:small_parcel_orders) do
          soap.body = data
        end
      end
    end
  end
end
