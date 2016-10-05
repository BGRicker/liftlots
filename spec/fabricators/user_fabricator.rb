Fabricator(:user) do
  email                 Faker::Internet.email
  password              "#WowCoolPassword1"
  password_confirmation "#WowCoolPassword1"
end
