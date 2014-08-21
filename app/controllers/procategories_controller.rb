class ProcategoriesController < ApplicationController
  before_filter :check_staff_login, except: [:show]
  before_action :set_procategory, only: [:show, :edit, :update, :destroy]

  # GET /procategories
  # GET /procategories.json
  def index
    # @procategories = Procategory.find_by_status(true)
    @procategories = Procategory.where(["level = ?", 1])
  end

  # GET /procategories/1
  # GET /procategories/1.json
  def show
    if ( !user_signed_in? ) || ( !current_user.is_staff? )
      @projects = @procategory.projects.where(["status = ? and share = ?", true, true]).page(params[:page]).per(2)
    end

    if current_user.is_staff?
      @cousins = Procategory.where(["level = ? and procategory_id = ?", @procategory.level, @procategory.procategory_id])       
      
      @family_tree = []

      procategory = @procategory
      @family_tree << procategory

      while procategory.level > 1 do
        procategory = procategory.procategory
        @family_tree << procategory
      end
    end     

    # if current_user.is_staff?
    #   @family_tree = []
    #   procategory = @procategory     

    #   while procategory.level >= 1 do
    #     @family_tree << procategory
    #     procategory = procategory.procategory
    #   end        
    # end    
  end

  # GET /procategories/new
  def new
    @procategory = Procategory.new
  end

  # GET /procategories/1/edit
  def edit
  end

  # POST /procategories
  # POST /procategories.json
  def create
    @procategory = current_user.procategories.new(procategory_params)

    respond_to do |format|
      if @procategory.save
        format.html { redirect_to @procategory, notice: 'Procategory was successfully created.' }
        format.json { render :show, status: :created, location: @procategory }
      else
        format.html { render :new }
        format.json { render json: @procategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procategories/1
  # PATCH/PUT /procategories/1.json
  def update
    respond_to do |format|
      if @procategory.update(procategory_params)
        format.html { redirect_to @procategory, notice: 'Procategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @procategory }
      else
        format.html { render :edit }
        format.json { render json: @procategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procategories/1
  # DELETE /procategories/1.json
  def destroy
    father_id = @procategory.procategory_id
    if check_empty?(@procategory.id)
      @procategory.destroy
      flash[:notice] = 'Procategory was successfully destroyed.'
    else
      flash[:notice] = 'You can only delete the empty project categories.'
    end

    father = Procategory.find(father_id)
    respond_to do |format|
      if father
        format.html { redirect_to father}
      else
        format.html { redirect_to procategories_path}
      end
      
      format.json { head :no_content }
    end

  end

  def add_new_procategory
    if params[:procategory_id].to_i == 0
      @procategory = current_user.procategories.new
      @procategory.name = params[:name]
      @procategory.ddc = params[:ddc]
      @procategory.description = params[:description]
      @procategory.procategory_id = 0
      @procategory.level = 1
      @procategory.save

      respond_to do |format|
        format.html { redirect_to procategories_path}
      end
    else
      father = Procategory.find(params[:procategory_id].to_i)
      @procategory = current_user.procategories.new
      @procategory.procategory = father
      @procategory.name = params[:name]
      @procategory.ddc = params[:ddc]
      @procategory.description = params[:description]
      @procategory.level = father.level + 1
      @procategory.save
      respond_to do |format|
        format.html { redirect_to father}
      end
    end
            
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procategory
      @procategory = Procategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procategory_params
      params.require(:procategory).permit(:name, :status, :user_id, :ddc, :description)
    end

    def check_staff_login
      if !user_signed_in? || !current_user.is_staff?
        flash[:notice] = "You are not staff so you cannot use this function"
        redirect_to root_path
      end
    end

    def check_empty?(id)
      procategory = Procategory.find(params[:id].to_i)
      if procategory.procategories.empty? && procategory.projects.empty?
        return true
      else
        return false
      end      
    end
end
