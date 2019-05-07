class Lib < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :readers, dependent: :destroy
  has_many :workers, dependent: :destroy
  has_many :servs, through: :books, dependent: :destroy
  
  validates :number, presence: true, length: { maximum: 100}
  validates :name, presence: true, length: { maximum: 1000}
  validates :adress, presence: true, length: { maximum: 500}
end
