module ThreePLCentral
  class StockStatus < Base

    class << self
      def get
        response = ThreePLCentral::Services.stock_status
        ThreePLCentral::Parser.hash_from_xml(response.body[:string])[:q]
      end
    end

  end
end
