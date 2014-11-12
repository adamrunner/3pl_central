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

    def self.find(params)
      xml_hash = read_creds
      xml_hash["limitCount"] = 10
      xml_hash["focr"] = params
      ThreePLCentral::Services.find_orders(xml_hash)
    end

    class << self

      def create(params)
        o = Order.new(params)
        o.create
      end

      def method_missing(meth, *args, &block)
        if meth.to_s =~ /^find_by_(.+)$/
          run_find_by_method($1, *args, &block)
        else
          super
        end
      end

      def respond_to?(meth)
        if meth.to_s =~ /^find_by_(.+)$/
          true
        else
          super
        end
      end

    end
  end
end
