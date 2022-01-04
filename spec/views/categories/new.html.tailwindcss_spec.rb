require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:all) do
    @month = FactoryBot.create(:month)
  end
  before(:each) do
    assign(:category, Category.new(
      name: "MyString",
      month: @month
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", month_categories_path(@month), "post" do

      assert_select "input[name=?]", "category[name]"
    end
  end
end
