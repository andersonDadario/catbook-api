require 'spec_helper'

describe "Skills API", type: :api do
  it 'do not lists all skills without user_id' do
    get '/api/v1/skills'

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # check to make sure the right amount of users are returned
    expect(json.length).to eq(0)
  end


  it 'lists all skills for user_id 1' do
    get '/api/v1/skills?user_id=1'

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # check to make sure the right amount of users are returned
    expect(json.length).to eq(2)
  end

  it 'show the correct attributes and values for each skill' do
    get '/api/v1/skills/1'

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # except key and values to match
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
    payload = {
        skill: {
            user_id: 1,
            name: "Cambalhota"
        }
    }
    post '/api/v1/skills', payload

    # test for the 200 status-code
    expect(last_response.status).to eq(201)

    # check to make sure the right amount of users are returned
    expected_res = {
            "id" => 21,
            "user_id" => 1,
            "name" => "Cambalhota",
            "total_of_endorsers" => 0,
            "endorsers" => []
        }
    expect(json).to eq(expected_res)
  end

  it 'updates a skill' do
    payload = {
        skill: {
            name: "Cambalhota Legal"
        }
    }
    patch '/api/v1/skills/5', payload

    # test for the 200 status-code
    expect(last_response.status).to eq(200)

    # check to make sure the right amount of users are returned
    expected_res = {
            "id" => 5,
            "user_id" => 3,
            "name" => "Cambalhota Legal",
            "total_of_endorsers" => 0,
            "endorsers" => []
        }
    expect(json).to eq(expected_res)
  end

  it 'deletes a skill' do
    delete '/api/v1/skills/20'

    expect(last_response.status).to eq(204)
  end

end