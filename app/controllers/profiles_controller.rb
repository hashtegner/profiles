class ProfilesController < ApplicationController
  def index
  end

  def search
    query = ProfilesByCriteriaQuery.new(Profile, params[:criteria] || {})
    query = query.by_criteria.includes(:state).ordered

    @profiles = query.page(params[:page])
  end
end
