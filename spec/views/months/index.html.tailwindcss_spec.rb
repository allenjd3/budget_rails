require 'rails_helper'

RSpec.describe "months/index", type: :view do
  before(:each) do
    assign(:months, [
      Month.create!(
        monthly_planned: 2,
        team: nil
      ),
      Month.create!(
        monthly_planned: 2,
        team: nil
      )
    ])
  end

  it "renders a list of months" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
