class PagesController < ApplicationController

  def index
    @featured_project = FeaturedProject.order(created_at: :asc).limit(6)
    @gallery = Gallery.order(created_at: :asc).limit(3)
  end

  def submit_form
    redirect_to featured_projects_pages_path
  end

  def featured_projects
    @featured_project = FeaturedProject.order(created_at: :asc)
  end

  def gallery
    @gallery = Gallery.order(created_at: :asc)
  end

end
