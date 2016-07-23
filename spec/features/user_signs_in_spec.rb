require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :feature do

  feature "sees right pages" do
    it "sees right page when logged out" do
      visit root_path
      expect(page).to have_content "Log in to create workouts"
    end

    it "sees right page when logged in" do
      sign_in_as("Kanye@west.com", "pizza123123")
      expect(page).to have_content "Welcome, kanye@west.com"
    end
  end

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

    it "won't allow a shortpassword" do
      sign_up_as("Kanye@west.com", "u")
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end

  end
  feature "User can sign in" do
    it "logs in without error" do
      sign_in
      expect(page).to_not have_content "error"
    end
  end
end
