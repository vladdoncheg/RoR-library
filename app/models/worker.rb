class Worker < ApplicationRecord
  belongs_to :lib
  
  validates :lastname, presence: true, length: { maximum: 100}
  validates :firstname, presence: true, length: { maximum: 100}
  validates :fathername, length: { maximum: 100}
  validates :position, presence: true, length: { maximum: 256}
  validates :education, length: { maximum: 100}
  validate :workdate_cannot_be_in_the_future

  def workdate_cannot_be_in_the_future
    if workdate.present? && workdate > Date.today
      errors.add(:workdate, 'Дата поступления не может быть в будущем')
    end
  end

end
