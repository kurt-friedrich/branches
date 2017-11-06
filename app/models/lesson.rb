class Lesson < ApplicationRecord
  validates :name, presence: true,
                   format: { with: /\A[a-zA-Z0-9 ]+\z/ }

  belongs_to :company
end
