require 'rails_helper'

RSpec.describe "months/show", type: :view do
  before(:each) do
    @month = assign(:month, Month.create!(
      monthly_planned: 2,
      team: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
