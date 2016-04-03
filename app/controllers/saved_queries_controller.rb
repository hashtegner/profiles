class SavedQueriesController < ApplicationController
  before_action :build_resource, only: [:new, :create]

  def new
  end

  def create
    if @saved_query.save
      redirect_to root_path
    else
      render :new
    end
  end

  protected

  def build_resource
    @saved_query ||= current_profile.saved_queries.new(permitted_params)
  end

  def permitted_params
    params.fetch(:saved_query, {}).permit(:name, :parameters)
  end
end
