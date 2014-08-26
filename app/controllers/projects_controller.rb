class ProjectsController < ApplicationController
  before_filter :check_staff_login, except: [:show, :index, :download_attachment]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    if user_signed_in? && current_user.is_staff?
      @flag = 0
      @flag += (4*(params[:page].to_i - 1)) if params[:page].to_i > 0
      @projects = current_user.projects.order("title").page(params[:page]).per(4)
    else
      @projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? and procategories.status = ?", true, true, true]).page(params[:page]).per(4)
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    session[:project_id] = @project.id
    @attachments = @project.attachments
    @feedbacks = @project.feedbacks.where(["status = ?", true]).page(params[:page]).per(4)
    @feedback = Feedback.new
    @attachment = Attachment.new
    if user_signed_in? && !current_user.is_staff?
      @invoice = current_user.invoices.joins(:invoicedetails).where(["invoicedetails.project_id = ? and invoices.status = ? and invoices.download_time > ?", @project.id, true, 0]).first
    end
  end

  # GET /projects/new
  def new
    procategories = Procategory.where(["status = ? and name != ?", true, '...'])
    if procategories.count > 0
      @project = Project.new      
    else
      redirect_to procategories_path, notice: t("controllers.project.no_category")
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
        format.html { redirect_to @project, notice: t("controllers.project.success_created") }
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
        format.html { redirect_to @project, notice: t("controllers.project.success_updated") }
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
    File.delete(@project.photo.url) if @project.photo_file_name
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: t("controllers.project.success_destroyed") }
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
      # check_projects = Project.where("id = ?", params[:id])
      # if check_projects.empty?
      #   respond_to do |format|
      #     format.html { redirect_to projects_path }
      #   end
      # else
      #   @project = Project.find(params[:id])
      # end
      begin
        @project = Project.find(params[:id])
      rescue Exception => ex
        flash[:notice] = t("controllers.project.not_exist")
        redirect_to projects_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :share, :status, :description, :price, :user_id,
        :procategory_id, :photo, :photo_file_name, :photo_content_type,
        :photo_file_size, :photo_updated_at)
    end

    def check_staff_login
      if ( !current_user ) || ( !current_user.is_staff? )
        redirect_to root_path, notice: t("controllers.project.staff_must_login")
      end
    end
end
