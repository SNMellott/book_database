class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  has_one :checkout
  has_one :user, through: :checkout
end
