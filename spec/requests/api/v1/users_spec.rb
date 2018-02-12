require 'spec_helper'

describe "Users API", type: :api do
  it 'lists all users' do
    get '/api/v1/users'

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # check to make sure the right amount of users are returned
    expect(json.length).to eq(10)
  end

  it 'show the correct attributes and values for each user' do
    get '/api/v1/users/1'

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # except key and values to match
    expected_user = {
        "email" => "cat1@ho.me",
        "id" => 1,
        "name" => "Cat1",
        "photo_url" => "/assets/images/cat1.jpg"
    }
    expect(json.keys.sort).to eq(expected_user.keys.sort)
    json.keys.each do |k|
      expect(expected_user[k]).to eq(json[k]) 
    end
  end

end