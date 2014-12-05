module ThreePLCentral
  class Base
    attr_accessor :facility_id
    def create_creds
      { "ThreePLKey" => ThreePLCentral.configuration.three_pl_key,
        "Login" => ThreePLCentral.configuration.login,
        "Password" => ThreePLCentral.configuration.password,
      }
    end

  end
end