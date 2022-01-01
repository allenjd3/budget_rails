require 'rails_helper'

RSpec.describe "months/edit", type: :view do
  before(:each) do
    @month = assign(:month, Month.create!(
      monthly_planned: 1,
      team: nil
    ))
  end

  it "renders the edit month form" do
    render

    assert_select "form[action=?][method=?]", month_path(@month), "post" do

      assert_select "input[name=?]", "month[monthly_planned]"

      assert_select "input[name=?]", "month[team_id]"
    end
  end
end
