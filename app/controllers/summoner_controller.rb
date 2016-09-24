class SummonerController < ApplicationController
  def welcome
  		@summoner_id = params[:summoner] || '68529602'
  		@summoner_info = League.get_summoner(@summoner_id)
  		@game_info = League.get_games(@summoner_id)
  end
end
