require 'spec_helper'

describe "API", type: :api do
  before(:all) do
    populate_db
  end

  it 'populates the db' do
    expect(User.all.count).to eq(10)
    expect(Skill.all.count).to eq(20)
    expect(Endorsement.all.count).to eq(2)
  end
end