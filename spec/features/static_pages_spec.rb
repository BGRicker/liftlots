require 'rails_helper'

RSpec.describe StaticPagesController, :type => :controller do

  describe "GET index" do

    it "renders the :index template" do
      expect(get: root_url(subdomain: nil)).to route_to(
        controller: "static_pages",
        action: "index")
    end

  end

end
