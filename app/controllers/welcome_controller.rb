class WelcomeController < ApplicationController
  def index
  	@projects = Project.where(["share = ? and status = ?", true, true])
  end
end
