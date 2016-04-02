class State < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  has_many :profiles, dependent: :restrict_with_error
end
