require 'spec_helper'

describe "Endorsements API", type: :api do
  it 'does not list all endorsements without user_id' do
    get '/api/v1/endorsements'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(0)
  end

  it 'lists all endorsements for user_id 1' do
    get '/api/v1/endorsements?user_id=1'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(0)
  end

  it 'lists all endorsements for user_id 2' do
    get '/api/v1/endorsements?user_id=2'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(1)
  end

  it 'lists all endorsements for user_id 2 and skill_id 1' do
    get '/api/v1/endorsements?user_id=2&skill_id=1'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(1)
  end

  it 'shows the correct attributes and values for each endorsement' do
    get '/api/v1/endorsements/1'
    expect(last_response.status).to eq(200)
    expected_endorsement = {
        "id" => 1,
        "user_id" => 2,
        "skill_id" => 1,
    }
    expect(json.keys.sort).to eq(expected_endorsement.keys.sort)
    json.keys.each do |k|
      expect(expected_endorsement[k]).to eq(json[k]) 
    end
  end

  it 'creates an endorsement' do
    post '/api/v1/endorsements', {
        endorsement: {
            user_id: 4,
            skill_id: 1
        }
    }
    expect(last_response.status).to eq(201)
    expect(json).to eq({
            "id" => 3,
            "user_id" => 4,
            "skill_id" => 1
        })
  end

  it 'deletes an endorsement' do
    delete '/api/v1/endorsements/2'
    expect(last_response.status).to eq(204)
  end

end