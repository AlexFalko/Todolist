class Task < ApplicationRecord
  belongs_to :todolist
  acts_as_list scope: :todolist
  validates :name, presence: true,
  length: { minimum: 1 }
end
