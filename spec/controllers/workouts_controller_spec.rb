require 'rails_helper'
require 'devise'

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
    context "a successful create" do
      login_user
      it "saves the customer object" do
        expect { post :create, params: { workout: Fabricate.attributes_for(:workout) } }.to change( Workout, :count).by(1)
      end
    end
  end

  context "User leaves title field blank" do
    it "does not save a new workout object" do
      expect { post :create, params: { workout: { title: '' } } }.to change(
      Workout, :count).by(0)
    end
  end

  describe "GET #edit" do
    context "succesful edit request" do
      login_user
      let(:workout) {Fabricate(:workout, user_id: @user.id) }
      it "sends a successful edit request" do
        get :edit, params: { id: workout }
        expect(response).to have_http_status(:success)
      end
    end
  end

  context "user isn't logged in and attempts an edit request" do
    let(:workout) {Fabricate(:workout) }
    it "sends an unsuccessful edit request" do
      get :edit, params: { id: workout }
      expect(response).to_not have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successful update" do
      login_user
      let(:chest) {Fabricate(:workout, title: "chest", user_id: @user.id)}
      it "updates the modified workout object" do
        put :update, params: { workout: Fabricate.attributes_for(:workout, title: "legs"), id: chest.id }
        expect(Workout.last.title).to eq("legs")
        expect(Workout.last.title).not_to eq("chest")
      end
    end
  end

  context "unsuccessful update when the user is not the creator of the workout" do
    let(:chest) {Fabricate(:workout, title: "chest")}
    it "does not update the modified workout object" do
      put :update, params: { workout: Fabricate.attributes_for(:workout, title:
        "legs"), id: chest.id }
        expect(Workout.last.title).not_to eq("legs")
        expect(Workout.last.title).to eq("chest")
      end
    end

    context "User leaves the workout title field blank" do
      login_user
      let(:chest) {Fabricate(:workout, title: "chest", user_id: @user.id)}
      it "does not update the modified workout object" do
        put :update, params: { workout: Fabricate.attributes_for(:workout, title: ""), id: chest.id }
        expect(response).to have_http_status(422)
        # 422 status is unprocessable_entity
      end
    end
  end
