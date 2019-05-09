class Book < ApplicationRecord
  belongs_to :lib
  has_many :servs, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 2000}
  validates :author, length: { maximum: 1000}
  validates :code, presence: true, length: { maximum: 100}
  validates :publisher, length: { maximum: 256}
  validates :year, length: { maximum: 38}, numericality: { greater_than_or_equal_to: 1000, less_than_or_equal_to: Date.today.year }
  validates :price, length: { maximum: 10}, numericality: { greater_than_or_equal_to: 0 }
  validate :date_cannot_be_in_the_future

  def date_cannot_be_in_the_future
    if date.present? && date > Date.today
      errors.add(:date, 'Не может быть в будущем')
    end
  end

end