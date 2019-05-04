class Reader < ApplicationRecord
  belongs_to :lib
  has_many :servs
  validates :number, presence: true, length: { maximum: 38}
  validates :lastname, presence: true, length: { maximum: 100}
  validates :firstname, presence: true, length: { maximum: 100}
  validates :fathername, length: { maximum: 100}
  validates :adress, presence: true, length: { maximum: 1000}
  validates :phone, presence: true, length: { maximum: 38}
end
