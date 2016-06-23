WSDL_URL = 'https://secure-wms.com/webserviceexternal/contracts.asmx?wsdl'
SOAP_ACTION_BASE_URL = 'http://www.JOI.com/schemas/ViaSub.WMS/'
require 'savon'
module ThreePLCentral
	class << self
		attr_accessor :configuration
	end

	def self.client
		@client ||= Savon.client(wsdl:WSDL_URL,
		  ssl_version: :TLSv1, ssl_verify_mode: :none,
			log_level: :debug, log: true, pretty_print_xml: true,
			no_message_tag:true, convert_request_keys_to: :camelcase)
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
	end

	class Configuration
		attr_accessor :three_pl_key, :login, :password, :default_facility_id,
			:three_pl_id, :customer_id

		def initialize
			@three_pl_key        = ''
			@login               = ''
			@password            = ''
			@default_facility_id = ''
			@three_pl_id 			   = ''
			@customer_id         = ''
		end
	end
end
