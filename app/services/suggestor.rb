require 'elasticsearch'

class Suggestor

	attr_reader :company_name

	def initialize(company_name)
		@company_name = company_name
		@client = Elasticsearch::Client.new log: true
	end

	def check_name
		json_response = @client.search index: 'company', body: { query: { match_phrase: { company_name: @company_name } } }
		if json_response["hits"]["total"] == 0
			"You can get this name."
		else
			give_suggestions
		end
	end

	private
	def give_suggestions
		form_suggestions_and_check_them
	end

	def form_suggestions_and_check_them
		suffixes = Suffix.all.map(&:name)
		replaceable_word = @company_name.split.find {|x| suffixes.include?(x)}
		suggestions_array = []
		suffixes.delete_if{|z| z == replaceable_word}.each do |suffix|
			suggestions_array << @company_name.sub(replaceable_word, suffix)
		end
		"The name isn't available. But you can still choose from below ones" + "\n" + suggestions_array.join("\n")
	end 
end