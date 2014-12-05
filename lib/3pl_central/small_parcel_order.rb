module ThreePLCentral
  class SmallParcelOrder < Base

    class << self
      def find(params)
        response = ThreePLCentral::Services.small_parcel_orders(params)
        response.body[:small_parcel_orders_result][:small_parcel]
      end
    end

  end
end
