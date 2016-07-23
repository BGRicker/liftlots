require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :feature do
  feature "User can sign up" do

    it "signs the user up" do
      sign_up_as("Kanye@west.com", "pizza123123")
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    it "won't allow a blank username" do
      sign_up_as("", "pizza123123")
      expect(page).to have_content "Email can't be blank"
    end

    it "won't allow a blank password" do
      sign_up_as("Cool@gmail.com", "")
      expect(page).to have_content "Password can't be blank"
    end
  end
end
