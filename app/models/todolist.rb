class Todolist < ApplicationRecord
    belongs_to :user
    has_many :tasks, -> { order(position: :asc) }, dependent: :destroy
    validates :title, presence: true,
    length: { minimum: 1 }


end

