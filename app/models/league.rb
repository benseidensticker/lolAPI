require 'httparty'

class League < ApplicationRecord
	include HTTParty

	@api_key = 'b1843141-e3b3-4bac-b9e6-a1e77c90ebe0'

	default_options.update(verify: false)
	base_uri "https://na.api.pvp.net/api/lol/na"
	default_params api_key: @api_key
	format :json

	def self.get_summoner id
		@error = nil 

		response = get("/v1.4/summoner/#{id}/", query: {})

		case response.code
			when 401 then @error = 'Unauthorized'
			when 404 then @error = "Summoner not found"
			when 429 then @error = "Rate limit exceeded"
			when 400 then @error = "Bad Request"
		end

		response
	end

	def self.get_games id
		response = get("/v1.3/game/by-summoner/#{id}/recent/",query: {}) 

		response["games"]
	end

	def self.get_champs
		get("/v1.2/champion/",query:{})
	end




end
