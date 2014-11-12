module ThreePLCentral
  class Services
    #TODO: ThreePLCentral.client.operations -> dynamically define methods?
    class << self
      def create_orders(data)
        ThreePLCentral.client.call(:create_orders, message:data)
      end

      def find_orders(data)
        ThreePLCentral.client.call(:find_orders, message:data)
      end
    end
  end
end
