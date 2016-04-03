class ProfilesByCriteriaQuery
  CONDITIONS = {
    equals: '= ?',
    not_equal: '!= ?',
    contains: 'ilike ?',
    not_contains: 'not ilike ?',
    greater_than: '> ?',
    less_than: '< ?',
    in: 'in (?)'
  }.freeze

  MATCH = {
    all: ' AND ',
    any: ' OR '
  }.freeze

  attr_reader :initial_scope, :options
  def initialize(initial_scope, options = {})
    @initial_scope = initial_scope
    @options = options
  end

  def match
    @match = MATCH[options[:match].to_s.to_sym] || MATCH[:any]
  end

  def permitted_fields
    @fields = %w(age job_title state_id)
  end

  # rubocop:disable Metrics/MethodLength
  def by_criteria
    fragments = []
    arguments = []

    permitted_fields.each do |field|
      extracted = extract_query(field)

      next unless extracted.present?

      fragments << extracted[0]
      arguments << extracted[1]
    end

    scope = initial_scope
    scope = scope.where(fragments.join(match), *arguments) if fragments.any?
    scope
  end

  protected

  def extract_query(field_name)
    criteria = CONDITIONS[options[:"#{field_name}_criteria"].to_s.to_sym]
    value = options[:"#{field_name}_value"]

    return nil unless criteria.present?

    condition = [field_name, criteria].join(' ')

    [condition, value]
  end
end
