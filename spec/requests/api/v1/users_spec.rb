require 'spec_helper'

describe "Users API", type: :api do
  it 'lists all users' do
    get '/api/v1/users'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(10)
  end

  it 'shows the correct attributes and values for each user' do
    get '/api/v1/users/1'
    expect(last_response.status).to eq(200)
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