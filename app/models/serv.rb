class Serv < ApplicationRecord
  belongs_to :book
  belongs_to :reader
end
