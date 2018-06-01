class AcquisitionSalesController < ApplicationController
  before_action :set_acquisition_sale, only: [:show, :edit, :update, :destroy]

  # GET /acquisition_sales
  # GET /acquisition_sales.json
  def index
    @acquisition_sales = AcquisitionSale.all
  end

  # GET /acquisition_sales/1
  # GET /acquisition_sales/1.json
  def show
  end

  # GET /acquisition_sales/new
  def new
    @acquisition_sale = AcquisitionSale.new
  end

  # GET /acquisition_sales/1/edit
  def edit
  end

  # POST /acquisition_sales
  # POST /acquisition_sales.json
  def create
    @acquisition_sale = AcquisitionSale.new(acquisition_sale_params)

    respond_to do |format|
      if @acquisition_sale.save
        format.html { redirect_to @acquisition_sale, notice: 'Acquisition sale was successfully created.' }
        format.json { render :show, status: :created, location: @acquisition_sale }
      else
        format.html { render :new }
        format.json { render json: @acquisition_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acquisition_sales/1
  # PATCH/PUT /acquisition_sales/1.json
  def update
    respond_to do |format|
      if @acquisition_sale.update(acquisition_sale_params)
        format.html { redirect_to @acquisition_sale, notice: 'Acquisition sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @acquisition_sale }
      else
        format.html { render :edit }
        format.json { render json: @acquisition_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acquisition_sales/1
  # DELETE /acquisition_sales/1.json
  def destroy
    @acquisition_sale.destroy
    respond_to do |format|
      format.html { redirect_to acquisition_sales_url, notice: 'Acquisition sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acquisition_sale
      @acquisition_sale = AcquisitionSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acquisition_sale_params
      params.require(:acquisition_sale).permit(:product_id, :qty, :value)
    end
end
