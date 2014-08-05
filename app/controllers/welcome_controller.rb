class WelcomeController < ApplicationController
  def index
  	@projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? 
  		and procategories.status = ? ", true, true, true])
  end
end
