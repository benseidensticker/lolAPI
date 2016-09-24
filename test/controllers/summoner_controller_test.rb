require 'test_helper'

class SummonerControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get summoner_welcome_url
    assert_response :success
  end

end
