class Serv < ApplicationRecord
  belongs_to :book
  belongs_to :reader
  validate :finish_cannot_be_lower_than_start
  validates :start, presence: true

  def finish_cannot_be_lower_than_start
    if finish < start
      errors.add(:finish, "can't be lower than start")
    end
  end 
end