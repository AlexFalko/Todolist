class Todolist < ApplicationRecord
    has_many :tasks, dependent: :destroy
    validates :title, presence: true,
    length: { minimum: 1 }
end

