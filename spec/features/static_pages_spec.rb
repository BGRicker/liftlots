require 'rails_helper'
require 'spec_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET index" do

    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "static_pages",
        action: "index")
    end

  end
end

RSpec.describe StaticPagesController, :type => :request do
  it "visits root_path" do
    visit root_path

    expect(page).to have_content 'Your Workouts'
  end
end
