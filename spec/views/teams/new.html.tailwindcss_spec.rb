require 'rails_helper'

RSpec.describe "teams/new", type: :view do
  before(:each) do
    assign(:team, Team.new(
      name: "MyString"
    ))
    @user = FactoryBot.create(:user)
  end

  it "renders new team form" do
    sign_in @user
    render

    assert_select "form[action=?][method=?]", teams_path, "post" do

      assert_select "input[name=?]", "team[name]"
    end
  end
end
