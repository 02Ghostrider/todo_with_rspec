FactoryBot.define do
  factory :homework, class: Task do
    id 1
    association :user
    name "Complete homework"
    priority 1
    due_date { DateTime.now.to_date + 2.days}
  end
  factory :email, class: Task do
    # id 2
    association :user
    name "Reply to Zack's email"
    priority 2
    due_date { DateTime.now.to_date }
  end
  factory :invalid_task do
    id nil
    name nil
    priority nil
    due_date nil
  end
end
