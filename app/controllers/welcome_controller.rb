class WelcomeController < ApplicationController
	before_filter :check_price, only: [:index]
  def index
    if params[:title] || params[:description] || params[:procategory_id] || params[:min_price] || params[:max_price]
  		@projects = Project.search(params[:title], params[:description], params[:min_price], params[:max_price], params[:procategory_id]).joins(:procategory).where(["projects.share = ? and projects.status = ? 
  		and procategories.status = ? ", true, true, true])
      flash[:notice] = "There are " + @projects.count.to_s + " projects"
      @projects = @projects.page(params[:page]).per(2)
  	else
  		@projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? and procategories.status = ? ", true, true, true]).page(params[:page]).per(2)
  	end
  end

  private
  def check_price
  	# if ( !params[:min_price].nil? || !params[:max_price].nil? ) && ( params[:min_price] != '' || params[:max_price] != '' )
  	# 	if !(( params[:min_price].to_f.is_a? Numeric ) && ( params[:max_price].to_f.is_a? Numeric ))
  	# 		flash[:notice] = "Inputted Price is incorrect"
  	# 		redirect_to root_path
  	# 	end
  	# end

    if ( ( !params[:min_price].nil? ) && ( params[:min_price] != '' ) && !( (params[:min_price].to_i.to_s == params[:min_price]) || (params[:min_price].to_f.to_s == params[:min_price]) ) ) && ( ( !params[:max_price].nil? ) && ( params[:max_price] != '' ) && !( (params[:max_price].to_i.to_s == params[:max_price]) || (params[:max_price].to_f.to_s == params[:max_price]) ) )
      flash[:notice] = "Inputted Price is incorrect"
      redirect_to root_path
    end
  end
end
