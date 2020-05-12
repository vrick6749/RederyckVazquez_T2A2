class Book < ApplicationRecord
  belongs_to :author
  belongs_to :publisher
  has_many :bookgenres
  has_many :genres, through: :bookgenres
end
