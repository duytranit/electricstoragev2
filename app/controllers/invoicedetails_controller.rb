class InvoicedetailsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :redirect, only: [:index, :show]
  before_action :set_invoicedetail, only: [:show, :edit, :update, :destroy]

  # GET /invoicedetails
  # GET /invoicedetails.json
  def index
    @invoicedetails = Invoicedetail.all
  end

  # GET /invoicedetails/1
  # GET /invoicedetails/1.json
  def show
  end

  # GET /invoicedetails/new
  def new
    @invoicedetail = Invoicedetail.new
  end

  # GET /invoicedetails/1/edit
  def edit
  end

  # POST /invoicedetails
  # POST /invoicedetails.json
  def create
    (session[:storage] ||= []) << params[:project_id]
    redirect_to root_path
    # @invoicedetail = Invoicedetail.new(invoicedetail_params)

    # respond_to do |format|
    #   if @invoicedetail.save
    #     format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully created.' }
    #     format.json { render :show, status: :created, location: @invoicedetail }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /invoicedetails/1
  # PATCH/PUT /invoicedetails/1.json
  def update
    respond_to do |format|
      if @invoicedetail.update(invoicedetail_params)
        format.html { redirect_to @invoicedetail, notice: 'Invoicedetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoicedetail }
      else
        format.html { render :edit }
        format.json { render json: @invoicedetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoicedetails/1
  # DELETE /invoicedetails/1.json
  def destroy
    @invoicedetail.destroy
    respond_to do |format|
      format.html { redirect_to invoicedetails_url, notice: 'Invoicedetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoicedetail
      @invoicedetail = Invoicedetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoicedetail_params
      params.require(:invoicedetail).permit(:invoice_id, :project_id, :release_date, :end_date, :status)
    end

    def redirect
      redirect_to invoices_path
    end
end
