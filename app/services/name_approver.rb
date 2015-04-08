require 'elasticsearch'

class NameApprover

	attr_reader :company_name

	def initialize(company_name)
		@company_name = company_name
		@client = Elasticsearch::Client.new log: true
	end

	def take_decision
		@client.search index: 'company', body: { query: { match_phrase: { company_name: @company_name } } }
	end

end