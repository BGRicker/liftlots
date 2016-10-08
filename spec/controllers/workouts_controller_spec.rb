require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  describe "GET #index" do
    login_user
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET #new" do
    login_user
    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    login_user
    context "a successful create" do
      it "saves the customer object" do
        expect { post :create, params: { workout: Fabricate.attributes_for(:workout) } }.to change( Workout, :count).by(1)
      end
    end
  end
end
