class SavedQuery < ApplicationRecord
  validates :name, presence: true, uniqueness: {
    scope: :profile_id, case_sensitive: false
  }

  belongs_to :profile, optional: false
end
