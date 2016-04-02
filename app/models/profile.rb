class Profile < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  validates :title_position, presence: true
  validates :age, presence: true, numericality: {
    only_integer: true, greater_than: 0
  }

  belongs_to :state, optional: false
end
