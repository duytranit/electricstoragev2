class AttachmentsController < ApplicationController
  before_filter :check_staff_login
  # before_filter :check_file, only: [:create]
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]

  # GET /attachments
  # GET /attachments.json
  def index
    project = Project.find(session[:project_id])
    redirect_to project
    # @attachments = Attachment.all
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
  end

  # GET /attachments/new
  def new
    @attachment = Attachment.new
    # @attachment = @project.attachments.new
  end

  # GET /attachments/1/edit
  def edit
  end

  # POST /attachments
  # POST /attachments.json
  def create
    project = Project.find(session[:project_id])

    if params[:attachment] && !params[:attachment][:file].nil?
      @attachment = project.attachments.new(attachment_params)

      respond_to do |format|
        if @attachment.save
          format.html { redirect_to project, notice: t("controllers.attachment.success_created") }
          format.json { render :show, status: :created, location: @attachment }
        else
          format.html { render :new }
          format.json { render json: @attachment.errors, status: :unprocessable_entity }
        end
      end      
    else
      flash[:notice] = t("controllers.attachment.choose_file")
      project = Project.find(session[:project_id])
      respond_to do |format|
        format.html { redirect_to project }
      end 
    end
      
  end

  # PATCH/PUT /attachments/1
  # PATCH/PUT /attachments/1.json
  def update
    respond_to do |format|
      if @attachment.update(attachment_params)
        format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @attachment }
      else
        format.html { render :edit }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment.destroy
    respond_to do |format|
      format.html { redirect_to attachments_url, notice: t("controllers.attachment.success_destroyed") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attachment
      @attachment = Attachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attachment_params
      params.require(:attachment).permit(:file)
    end

    def check_staff_login
      if !(current_user.is_staff? && session[:project_id] != nil)
        redirect_to root_path
      end
    end

    # def check_file
    #   if @attachment.file.nil?
    #     flash[:notice] = "Please choose file"
    #     project = Project.find(session[:project_id])
    #     respond_to do |format|
    #       format.html { redirect_to project }
    #     end        
    #   end
    # end
end
