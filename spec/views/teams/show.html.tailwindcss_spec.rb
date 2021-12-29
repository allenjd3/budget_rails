require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @team = assign(:team, Team.create!(
      name: "Name"
    ))
    @user = @team.users.create(FactoryBot.attributes_for(:user))
  end

  it "renders attributes in <p>" do
    sign_in @user
    render
    expect(rendered).to match(/Name/)
  end
end
