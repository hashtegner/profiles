class Profile < ApplicationRecord
  paginates_per 15

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  validates :profession, presence: true
  validates :age, presence: true, numericality: {
    only_integer: true, greater_than: 0
  }

  belongs_to :state, optional: false
  has_many :saved_queries, dependent: :destroy

  scope :ordered, -> { order(email: :asc) }
end
