module ThreePLCentral
  class Order < Base
    attr_accessor :order_data

    def initialize(params)
      if params[:facility_id]
        facility_id = params[:facility_id]
        params.delete(:facility_id)
      end
      @order_data = params
    end


    def create
      xml_hash = create_creds
      xml_hash["orders"] = [{order:order_data}]
      ThreePLCentral::Services.create_orders(xml_hash)
    end

    class << self

      def find(params)
        xml_hash = read_creds
        xml_hash["limitCount"] = 10
        xml_hash["focr"] = params
        response = ThreePLCentral::Services.find_orders(xml_hash)
        parser.parse(response.body[:find_orders])
          .with_indifferent_access["orders"]["order"]
          .arrayify
      end

      def create(params)
        o = Order.new(params)
        o.create
      end

    end
  end
end
