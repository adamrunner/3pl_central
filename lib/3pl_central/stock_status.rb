module ThreePLCentral
  class StockStatus < Base

    class << self
      def get
        response = ThreePLCentral::Services.stock_status(read_creds)
        parser.parse(response.body[:string])[:my_data_set][:q]
      end
    end

  end
end
