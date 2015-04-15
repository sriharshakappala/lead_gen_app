require 'elasticsearch'

class LeadGenController < ApplicationController
	def choose_name
	end
	def take_decision
		name_approver = NameApprover.new(params["company_name"])
		json_data = name_approver.take_decision
		render :json => json_data
	end

	def suggestor
	end

	def suggestion_engine
		suggestor = Suggestor.new(params["company_name"])
		response = suggestor.check_name
		render :text => response
	end
end