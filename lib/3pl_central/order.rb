module ThreePLCentral
  class Order < Base
    attr_accessor :order_data

    def initialize(params)
      @order_data = params
    end


    def create
      ThreePLCentral::Services.create_orders(create_creds, order_data)
    end

    class << self

      def find(params)
        response = ThreePLCentral::Services.find_orders(params)
        Nori.parse(response.body[:find_orders])["orders"]["order"].arrayify
      end

      def create(params)
        o = Order.new(params)
        o.create
      end

    end
  end
end
