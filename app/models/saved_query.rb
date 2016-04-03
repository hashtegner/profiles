class SavedQuery < ApplicationRecord
  serialize :parameters, JSON

  validates :name, presence: true, uniqueness: {
    scope: :profile_id, case_sensitive: false
  }

  validates :parameters, presence: true

  belongs_to :profile, optional: false
end
