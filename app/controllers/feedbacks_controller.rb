class FeedbacksController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  before_filter :check_no_index, only: [:index]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = Feedback.all
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @reply = Reply.new
    @replies = @feedback.replies.where(["status = ?", true])
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # GET /feedbacks/1/edit
  def edit
  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create        
    @feedback = current_user.feedbacks.new(feedback_params)

    if !current_user.is_staff?
      @feedback.project = Project.find(session[:project_id])
    end
    

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback.project, notice: 'Feedback was successfully created.' }
        format.json { render :show, status: :created, location: @feedback.project }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feedback_params
      params.require(:feedback).permit(:user_id, :project_id, :content, :status)
    end

    def check_no_index
      flash[:notice] = "You cannot use this function"
      redirect_to root_path
    end
end
