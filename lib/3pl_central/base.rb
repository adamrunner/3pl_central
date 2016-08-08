module ThreePLCentral
  class Base
    attr_accessor :facility_id
    def create_creds
      {"extLoginData" => {
        "ThreePLKey" => ThreePLCentral.configuration.three_pl_key,
        login: ThreePLCentral.configuration.login,
        password: ThreePLCentral.configuration.password,
        Facility_ID: facility_id || ThreePLCentral.configuration.default_facility_id,
        Customer_ID: ThreePLCentral.configuration.customer_id
      }}
    end

    def self.read_creds
      {"userLoginData" => {
        "ThreePLID" => ThreePLCentral.configuration.three_pl_id,
        login: ThreePLCentral.configuration.login,
        password: ThreePLCentral.configuration.password
        }}
    end

    def self.parser
      @parser ||= Nori.new(:convert_tags_to => lambda { |tag| tag.snakecase.to_sym })
    end

  end
end
