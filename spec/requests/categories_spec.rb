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

RSpec.describe "/categories", type: :request do

  before(:each) do
    @month = FactoryBot.create(:month)
    @user = @month.team.users.create(FactoryBot.attributes_for(:user))
    sign_in @user
  end
  # Category. As you add validations to Category, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      name: "Category Name",
      month: @month,
    }
  }

  let(:invalid_attributes) {
    {
      name: "",
      month: @month,
    }
  }

  describe "GET /show" do
    it "renders a successful response" do
      category = Category.create! valid_attributes
      get category_url(category)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_month_category_url(@month)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      category = Category.create! valid_attributes
      get edit_category_url(category)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect {
          post month_categories_url(@month), params: { category: valid_attributes }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the created category" do
        post month_categories_url(@month), params: { category: valid_attributes }
        expect(response).to redirect_to(@month)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect {
          post month_categories_url(@month), params: { category: invalid_attributes }
        }.to change(Category, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post month_categories_url(@month), params: { category: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "New Name"}
      }

      it "updates the requested category" do
        category = Category.create! valid_attributes
        patch category_url(category), params: { category: new_attributes }
        category.reload
        expect(category.name).to eq("New Name")
      end

      it "redirects to the category" do
        category = Category.create! valid_attributes
        patch category_url(category), params: { category: new_attributes }
        category.reload
        expect(response).to redirect_to(category_url(category))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        category = Category.create! valid_attributes
        patch category_url(category), params: { category: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category = Category.create! valid_attributes
      expect {
        delete category_url(category)
      }.to change(Category, :count).by(-1)
    end

    it "redirects to the categories list" do
      category = Category.create! valid_attributes
      delete category_url(category)
      expect(response).to redirect_to(month_categories_url(@month))
    end
  end
end
