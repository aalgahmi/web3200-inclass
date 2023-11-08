class Tutor < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :courses
  has_many :availabilities
  has_many :appointments, through: :availabilities
  validates :name, :bio, presence: true
end
