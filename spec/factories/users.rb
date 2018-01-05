FactoryBot.define do
  factory :user do
    firstname {FFaker::Name.first_name}
    lastname {FFaker::Name.last_name}
    email {FFaker::Internet.email}
    password 'Password1'
    encrypted_password 'Password1'

    factory :user_with_tasks do
      after(:build) do |user|
        [:homework, :email].each do |task|
          user.tasks << FactoryBot.build(task, user: user)
        end
      end
    end
  end
end
