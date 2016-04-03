module ApplicationHelper
  def search_integer_options
    ProfilesByCriteriaQuery::NUMBERS.map do |value|
      [t(value, scope: 'profiles.search_form.criteria_options'), value]
    end
  end

  def search_string_options
    ProfilesByCriteriaQuery::STRINGS.map do |value|
      [t(value, scope: 'profiles.search_form.criteria_options'), value]
    end
  end

  def search_match_options
    ProfilesByCriteriaQuery::MATCH.keys.map do |value|
      [t(value, scope: 'profiles.search_form.match_options'), value]
    end
  end
end
