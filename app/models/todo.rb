class Todo < ApplicationRecord
	validates :task, presence: true
	validates :description, presence: true, length: { minimum: 10 }

	belongs_to :user
end
