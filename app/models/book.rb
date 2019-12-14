class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  has_many :checkouts, dependent: :delete_all
  has_many :users, through: :checkouts
end
