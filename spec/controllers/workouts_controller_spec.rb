require 'rails_helper'

RSpec.describe WorkoutsController, type: :controller do

  describe "GET #index" do
    login_user
    it "returns a successful http request status code" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
