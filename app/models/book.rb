class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  belongs_to :publisher
  has_many :bookgenres, dependent: :destroy
  has_many :genres, through: :bookgenres
  accepts_nested_attributes_for :bookgenres
  validates :title, presence: true
  validates :price, presence: true
  has_one_attached :picture

end
