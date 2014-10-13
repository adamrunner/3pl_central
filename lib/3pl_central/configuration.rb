module ThreePlCentral
	class Configuration
		attr_accessor :three_pl_key, :login, :password, :facility_id

		def initialize
			@three_pl_key = nil
			@login = nil
			@password = nil
      @facility_id = nil
		end
end
