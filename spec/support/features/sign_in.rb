module Features
  def sign_in
    sign_in_as "Kanye@West.com", "pizza123123"
  end

  def sign_in_as(email, password)
    visit root_path
    click_on "Sign in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button  "Log in"
  end

  def sign_up_as(email, password)
    visit root_path
    click_on 'Sign up'
    fill_in "Email", with: email
    fill_in "Password", with: password, :match => :prefer_exact
    fill_in "Password confirmation", with: password, :match => :prefer_exact
    click_button  "Sign up"
  end
end
