class Serv < ApplicationRecord
  belongs_to :book
  belongs_to :reader
  
  validates :start, presence: true
  validates :reader_id, presence: true
  validate :finish_cannot_be_lower_than_start,
           :start_cannot_be_in_the_future,
           :finish_cannot_be_in_the_future

  def finish_cannot_be_lower_than_start
    if finish
      if finish < start
        errors.add(:finish, "Не может быть меньше, чем дата выдачи")
      end
    end
  end 

  def start_cannot_be_in_the_future
    if start.present? && start > Date.today
      errors.add(:start, 'Не может быть в будущем')
    end
  end

  def finish_cannot_be_in_the_future
    if finish.present? && finish > Date.today
      errors.add(:finish, 'Не может быть в будущем')
    end
  end

end