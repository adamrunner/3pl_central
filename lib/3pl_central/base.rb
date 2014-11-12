module ThreePLCentral
  class Base
    attr_accessor :facility_id
    def create_creds
      {"extLoginData" => {
        "ThreePLKey" => ThreePLCentral.configuration.three_pl_key,
        login: ThreePLCentral.configuration.login,
        password: ThreePLCentral.configuration.password,
        facility_id: facility_id || ThreePLCentral.configuration.default_facility_id
      }}
    end

    def self.read_creds
      {"userLoginData" => {
        "ThreePLID" => ThreePLCentral.configuration.user_login_id,
        login: ThreePLCentral.configuration.login,
        password: ThreePLCentral.configuration.password
        }}
    end
  end
end
