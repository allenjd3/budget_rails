require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do
    assign(:teams, [
      Team.create!(
        name: "Name"
      ),
      Team.create!(
        name: "Name"
      )
    ])
    @user = FactoryBot.create(:user)
  end

  it "renders a list of teams" do
    sign_in @user
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
