class Task < ApplicationRecord
  belongs_to :todolist
  validates :name, presence: true,
  length: { minimum: 1 }
end
