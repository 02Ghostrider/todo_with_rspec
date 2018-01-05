require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:homework)).to be_valid
  end

  it 'is valid with required attributes' do
    task = create(:email)
    expect(task).to be_valid
  end

  it 'is invalid without a name' do
    task = build(:homework, name: nil)
    expect(task).not_to be_valid
  end

  it 'is invalid without a priority' do
    task = build(:email, priority: nil)
    expect(task).not_to be_valid
  end

  it 'is invalid without Due Date' do
    task = build(:homework, due_date: nil)
    expect(task).not_to be_valid
  end

  it 'belongs to User' do
    expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

end
