class ProjectsController < ApplicationController
  before_filter :check_staff_login, except: [:show, :index, :download_attachment]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if current_user.is_staff?
      @projects = current_user.projects.order("title").page(params[:page]).per(2)
    else
      @projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? and procategories.status = ?", true, true, true]).page(params[:page]).per(2)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    session[:project_id] = @project.id
    @attachments = @project.attachments
    @feedbacks = @project.feedbacks.where(["status = ?", true]).page(params[:page]).per(4)
    @feedback = Feedback.new
    if user_signed_in? && !current_user.is_staff?
      @invoice = current_user.invoices.joins(:invoicedetails).where(["invoicedetails.project_id = ? and invoices.status = ? and invoices.download_time > ?", @project.id, true, 0]).first
    end
  end

  # GET /projects/new
  def new
    procategories = Procategory.where(["status = ?", true])
    if procategories.count > 0
      @project = Project.new      
    else
      redirect_to new_procategory_path, notice: "There are not any Project Category. You need to add new Project Category !"
    end    
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created. You need to wait for accepting Project Category' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download_attachment
    attachment = Attachment.find(params[:attachment_id])
    invoice = Invoice.find(params[:invoice_id])
    invoice.download_time -= 1
    invoice.save
    respond_to do |format|
      format.html { redirect_to attachment.file.url}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :share, :status, :description, :price, :user_id,
        :procategory_id, :photo, :photo_file_name, :photo_content_type,
        :photo_file_size, :photo_updated_at)
    end

    def check_staff_login
      if ( !current_user ) || ( !current_user.is_staff? )
        redirect_to root_path, notice: "You must to login as a staff to use this function"  
      end
    end
end
