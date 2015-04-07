require 'elasticsearch'

class LeadGenController < ApplicationController
	def choose_name
	end
	def take_decision
		client = Elasticsearch::Client.new log: true
		json_data = client.search index: 'company', body: { query: { match_phrase: { company_name: params["company_name"] } } }
		render :json => json_data
	end
end