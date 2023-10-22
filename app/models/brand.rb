class Brand < ApplicationRecord

  # validates
  validates_presence_of :name
  validates_length_of :name, maximum: 30
  validates :name, uniqueness: true
end
