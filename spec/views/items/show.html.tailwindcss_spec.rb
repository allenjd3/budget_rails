require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:all) do
    @category = FactoryBot.create(:category)
  end
  before(:each) do
    @item = assign(:item, Item.create!(
      name: "Name",
      planned: 2,
      remaining: 3,
      is_fund: false,
      category: @category
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
