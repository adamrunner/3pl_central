module ThreePLCentral
  class SmallParcelOrder < Base

    class << self
      def find(params)
        xml_hash = read_creds
        xml_hash["focr"] = params
        response = ThreePLCentral::Services.small_parcel_orders(xml_hash)
        response.body[:small_parcel_orders_result][:small_parcel]
      end
    end

  end
end
