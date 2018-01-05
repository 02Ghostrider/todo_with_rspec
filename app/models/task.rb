class Task < ApplicationRecord
	validates :name, presence: true
	validates :priority, presence: true
	validates :due_date, presence: true

	belongs_to :user
end
