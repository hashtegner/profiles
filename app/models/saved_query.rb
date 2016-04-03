class SavedQuery < ApplicationRecord
  validates :name, presence: true, uniqueness: {
    scope: :profile_id, case_sensitive: false
  }

  validates :parameters, presence: true

  belongs_to :profile, optional: false

  default_scope -> { order(name: :asc) }

  def safe_parameters
    @safe_parameters ||= Rack::Utils.parse_nested_query(parameters)
                                    .with_indifferent_access
  end
end
