class Pet < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :breed, presence: true, length: { minimum: 3 }
  validates :image, presence: true
end
