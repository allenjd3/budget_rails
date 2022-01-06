 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/items", type: :request do

  before(:all) do
    @category = FactoryBot.create(:category)
    @user = FactoryBot.create(:user)
  end
  before(:each) do
    sign_in @user
  end
  # Item. As you add validations to Item, be sure to
  # adjust the attributes here as well.
  # t.string :name
  #       t.integer :planned
  #       t.integer :remaining
  #       t.boolean :is_fund
  #       t.belongs_to :category, null: false, foreign_key: true
  let(:valid_attributes) {
    {
      name: "item name",
      planned: 1234,
      remaining: 1234,
      is_fund: false,
      category: @category,
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      planned_cents: 1234,
      remaining_cents: 1234,
      is_fund: false,
      category: @category,
    }
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_category_item_path(@category)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      item = Item.create! valid_attributes
      get edit_item_url(item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post category_items_url(@category), params: { item: valid_attributes }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post category_items_url(@category), params: { item: valid_attributes }
        expect(response).to redirect_to(@category.month)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        expect {
          post category_items_url(@category), params: { item: invalid_attributes }
        }.to change(Item, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post category_items_url(@category), params: { item: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(response).to redirect_to(item_url(item))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete item_url(item)
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete item_url(item)
      expect(response).to redirect_to(@category.month)
    end
  end
end
