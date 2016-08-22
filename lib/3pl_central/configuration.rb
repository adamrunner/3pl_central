WSDL_URL = "https://app02.3plcentral.com/WebServiceExternal/Contracts.asmx?wsdl"
SOAP_ACTION_BASE_URL = 'http://www.JOI.com/schemas/ViaSub.WMS/'

require 'savon'

module ThreePLCentral
	class << self
		attr_accessor :configuration
	end

	def self.client
		@client ||= Savon.client(savon_config)
	end

	def self.savon_config
		@savon_config ||= {wsdl:WSDL_URL, adapter: :net_http,
		  ssl_version: :TLSv1, ssl_verify_mode: :none,
			log_level: :debug, log: true, pretty_print_xml: true,
			no_message_tag:true, convert_request_keys_to: :camelcase}
			.with_indifferent_access
			.merge(configuration.savon_config)
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
	end

	class Configuration
		# TODO remove duplication, specifying config values in one place
		attr_accessor :three_pl_key, :login, :password, :default_facility_id,
			:three_pl_id, :customer_id, :savon_config

		def initialize
			@three_pl_key        = ''
			@login               = ''
			@password            = ''
			@default_facility_id = ''
			@three_pl_id 			   = ''
			@customer_id         = ''
			@savon_config        = {}
		end
	end
end
