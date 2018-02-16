require 'spec_helper'

describe "Skills API", type: :api do
  it 'does not list all skills without user_id' do
    get '/api/v1/skills'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(0)
  end

  it 'lists all skills for user_id 1' do
    get '/api/v1/skills?user_id=1'
    expect(last_response.status).to eq(200)
    expect(json.length).to eq(2)
  end

  it 'shows the correct attributes and values for each skill' do
    get '/api/v1/skills/1'
    expect(last_response.status).to eq(200)
    expected_skill = {
        "id" => 1,
        "user_id" => 1,
        "name" => "Jump",
        "total_of_endorsers" => 2,
        "endorsers" => [
            {"id"=>2, "name"=>"Cat2", "photo_url"=>"/assets/images/cat2.jpg"},
            {"id"=>3, "name"=>"Cat3", "photo_url"=>"/assets/images/cat3.jpg"}
        ]
    }
    expect(json.keys.sort).to eq(expected_skill.keys.sort)
    json.keys.each do |k|
      expect(expected_skill[k]).to eq(json[k]) 
    end
  end

  it 'creates a skill' do
    post '/api/v1/skills', {
        skill: {
            user_id: 1,
            name: "Cambalhota"
        }
    }
    expect(last_response.status).to eq(201)
    expect(json).to eq({
            "id" => 21,
            "user_id" => 1,
            "name" => "Cambalhota",
            "total_of_endorsers" => 0,
            "endorsers" => []
        })
  end

  it 'updates a skill' do
    patch '/api/v1/skills/5', {
        skill: {
            name: "Cambalhota Legal"
        }
    }
    expect(last_response.status).to eq(200)
    expect(json).to eq({
            "id" => 5,
            "user_id" => 3,
            "name" => "Cambalhota Legal",
            "total_of_endorsers" => 0,
            "endorsers" => []
        })
  end

  it 'deletes a skill' do
    delete '/api/v1/skills/20'
    expect(last_response.status).to eq(204)
  end

end