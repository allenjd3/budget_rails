require 'rails_helper'

RSpec.describe "months/new", type: :view do
  before(:each) do
    assign(:month, Month.new(
      monthly_planned: 1,
      team: nil
    ))
  end

  it "renders new month form" do
    render

    assert_select "form[action=?][method=?]", months_path, "post" do

      assert_select "input[name=?]", "month[monthly_planned]"

      assert_select "input[name=?]", "month[team_id]"
    end
  end
end
