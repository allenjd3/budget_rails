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

RSpec.describe "/months", type: :request do
  
  # Month. As you add validations to Month, be sure to
  # adjust the attributes here as well.
  before(:all) do
    @team = FactoryBot.create(:team)
  end
  let(:valid_attributes) {
    {
    month: "20220101",
    monthly_planned: 2345,
    team: @team,
    }
  }

  let(:invalid_attributes) {
    {
    month: "",
    monthly_planned: 2345,
    team: 1,
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Month.create! valid_attributes
      get team_months_path @team
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      month = Month.create! valid_attributes
      get month_url(month)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_team_month_url @team
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      month = Month.create! valid_attributes
      get edit_month_url(month)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Month" do
        expect {
          post team_months_url(@team), params: { month: valid_attributes }
        }.to change(Month, :count).by(1)
      end

      it "redirects to the created month" do
        post team_months_url(@team), params: { month: valid_attributes }
        expect(response).to redirect_to(month_url(Month.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Month" do
        expect {
          post team_months_url(@team), params: { month: invalid_attributes }
        }.to change(Month, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post team_months_url(@team), params: { month: invalid_attributes }
        puts response.inspect
        expect(response.status).to eq(422)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { month: 20220201}
      }

      it "updates the requested month" do
        month = Month.create! valid_attributes
        patch month_url(month), params: { month: new_attributes }
        month.reload
        expect(month.month.to_s).to eq('2022-02-01')
      end

      it "redirects to the month" do
        month = Month.create! valid_attributes
        patch month_url(month), params: { month: new_attributes }
        month.reload
        expect(response).to redirect_to(month_url(month))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        month = Month.create! valid_attributes
        patch month_url(month), params: { month: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested month" do
      month = Month.create! valid_attributes
      expect {
        delete month_url(month)
      }.to change(Month, :count).by(-1)
    end

    it "redirects to the months list" do
      month = Month.create! valid_attributes
      delete month_url(month)
      expect(response).to redirect_to(team_months_url(@team))
    end
  end
end
