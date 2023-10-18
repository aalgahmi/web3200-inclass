class Tutor < ApplicationRecord
  has_and_belongs_to_many :courses
  has_many :availabilities
  has_many :appointments, through: :availabilities
  validates :name, :email, :bio, presence: true
end
