require 'rails_helper'

RSpec.describe User, type: :model do
  it "belongs to a team" do
    team = Team.create!([name: "First Name"])
  end
end
