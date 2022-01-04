require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      planned: 1,
      remaining: 1,
      is_fund: false,
      category: nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[planned]"

      assert_select "input[name=?]", "item[remaining]"

      assert_select "input[name=?]", "item[is_fund]"

      assert_select "input[name=?]", "item[category_id]"
    end
  end
end
