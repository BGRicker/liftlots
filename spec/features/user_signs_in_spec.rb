require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :feature do
  feature "User can sign up" do

    it "signs the user up" do
      sign_up_as("Kanye@west.com", "pizza123123")
    end
  end
end
