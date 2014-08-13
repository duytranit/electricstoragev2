class ProcategoriesController < ApplicationController
  before_filter :check_staff_login, except: [:show]
  before_action :set_procategory, only: [:show, :edit, :update, :destroy]

  # GET /procategories
  # GET /procategories.json
  def index
    # @procategories = Procategory.find_by_status(true)
    @procategory = Procategory.find_by_procategory_id(0)
  end

  # GET /procategories/1
  # GET /procategories/1.json
  def show
    if ( !user_signed_in? ) || ( !current_user.is_staff? )
      @projects = @procategory.projects.where(["status = ? and share = ?", true, true]).page(params[:page]).per(2)
    end    
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
    @procategory.destroy
    respond_to do |format|
      format.html { redirect_to procategories_url, notice: 'Procategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_new_procategory
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_procategory
      @procategory = Procategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def procategory_params
      params.require(:procategory).permit(:name, :status, :user_id)
    end

    def check_staff_login
      if !user_signed_in? || !current_user.is_staff?
        flash[:notice] = "You are not staff so you cannot use this function"
        redirect_to root_path
      end
    end
end
