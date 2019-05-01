class Worker < ApplicationRecord
  belongs_to :lib
  validates :lastname, presence: true, length: { maximum: 100}
  validates :firstname, presence: true, length: { maximum: 100}
  validates :fathername, length: { maximum: 100}
  validates :position, presence: true, length: { maximum: 256}
  validates :education, length: { maximum: 100}
end
