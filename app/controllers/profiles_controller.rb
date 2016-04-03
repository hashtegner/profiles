class ProfilesController < ApplicationController
  def index
  end

  def search
    query = ProfilesByCriteriaQuery.new(Profile, criteria_params)
    query = query.by_criteria.includes(:state).ordered

    @profiles = query.page(params[:page])
  end

  protected

  def criteria_params
    @criteria_params ||= params[:criteria] || {}
  end

  helper_method :criteria_params
end
