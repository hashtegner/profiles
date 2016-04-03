class ProfilesController < ApplicationController
  def index
  end

  def search
    query = ProfilesByCriteriaQuery.new(Profile, params[:criteria] || {})

    @profiles = query.by_criteria.ordered.page(params[:page])
  end
end
