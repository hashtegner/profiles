require 'faker'

after :states do
  state = State.pluck(:id)

  I18n.available_locales << :en

  150.times do
    Profile.where(email: Faker::Internet.email).first_or_create(
      age: rand(16..85),
      state_id: state.sample,
      profession: Faker::Company.profession,
      password: 'password',
      password_confirmation: 'password'
    )
  end
end
