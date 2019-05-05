class Lib < ApplicationRecord
  has_many :books
  has_many :readers
  has_many :workers
  has_many :servs, through: :books
  
  validates :number, presence: true, length: { maximum: 100}
  validates :name, presence: true, length: { maximum: 1000}
  validates :adress, presence: true, length: { maximum: 500}
end
