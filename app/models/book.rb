class Book < ApplicationRecord
  belongs_to :lib
  validates :name, presence: true, length: { maximum: 2000}
  validates :author, length: { maximum: 1000}
  validates :code, presence: true, length: { maximum: 100}
  validates :publisher, length: { maximum: 256}
  validates :year, length: { maximum: 38}
  validates :price, length: { maximum: 10}
end
