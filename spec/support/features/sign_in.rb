module Features
  def sign_in
    sign_in_as "Kanye@West.com"
  end

  def sign_in_as(email)
    visit root_path
    fill_in "Email", with: email
    click_on  "Sign in"
  end

  def sign_up_as(email, password)
    visit root_path
    click_on 'Sign up'
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on  "Sign up"
  end
end
