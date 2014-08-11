class WelcomeController < ApplicationController
  def index
  	@projects = Project.search(params[:search], params[:procategory_id]).joins(:procategory).where(["projects.share = ? and projects.status = ? 
  		and procategories.status = ? ", true, true, true]).page(params[:page]).per(2)
  end
end
