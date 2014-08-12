class InvoicesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
    if ( user_signed_in? ) && ( !current_user.is_staff? )
      @invoices = current_user.invoices
    else
      @invoices = Invoice.joins(:invoicedetails).joins(:projects).where(["projects.user_id = ?", current_user.id])
    end
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = current_user.invoices.new(invoice_params)
    @invoice.user = current_user

    respond_to do |format|
      if @invoice.save

        session[:storage].each do |id|
          @invoicedetail = @invoice.invoicedetails.new
          @invoicedetail.project_id = id
          @invoicedetail.save
        end

        session[:storage].clear

        format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def remove_project_out_invoice
    session[:storage].delete(params[:project_id])
    if session[:storage].count > 0
      redirect_to new_invoice_path
    else
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:user_id, :content, :note, :status, :from_date, :end_date, :download_time)
    end
end
