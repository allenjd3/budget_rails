require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:all) do
    @category = FactoryBot.create(:category)
  end
  before(:each) do
    @item = assign(:item, Item.create!(
      name: "MyString",
      planned: 1,
      remaining: 1,
      is_fund: false,
      category: @category
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[planned]"

      assert_select "input[name=?]", "item[remaining]"

      assert_select "input[name=?]", "item[is_fund]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
