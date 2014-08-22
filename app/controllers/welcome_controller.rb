class WelcomeController < ApplicationController
  def index
  	if params[:title] || params[:description] || params[:procategory_id]
  		@projects = Project.search(params[:title], params[:description], params[:min_price], params[:max_price], params[:procategory_id]).joins(:procategory).where(["projects.share = ? and projects.status = ? 
  		and procategories.status = ? ", true, true, true]).page(params[:page]).per(2)
  	else
  		@projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? and procategories.status = ? ", true, true, true]).page(params[:page]).per(2)
  	end
  end
end
