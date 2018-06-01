class ProductSalesController < ApplicationController
  before_action :set_product_sale, only: [:show, :edit, :update, :destroy]

  # GET /product_sales
  # GET /product_sales.json
  def index
    @product_sales = ProductSale.all
  end

  # GET /product_sales/1
  # GET /product_sales/1.json
  def show
  end

  # GET /product_sales/new
  def new
    @product_sale = ProductSale.new
  end

  # GET /product_sales/1/edit
  def edit
  end

  # POST /product_sales
  # POST /product_sales.json
  def create
    @product_sale = ProductSale.new(product_sale_params)

    respond_to do |format|
      if @product_sale.save
        format.html { redirect_to @product_sale, notice: 'Product sale was successfully created.' }
        format.json { render :show, status: :created, location: @product_sale }
      else
        format.html { render :new }
        format.json { render json: @product_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_sales/1
  # PATCH/PUT /product_sales/1.json
  def update
    respond_to do |format|
      if @product_sale.update(product_sale_params)
        format.html { redirect_to @product_sale, notice: 'Product sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_sale }
      else
        format.html { render :edit }
        format.json { render json: @product_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sales/1
  # DELETE /product_sales/1.json
  def destroy
    @product_sale.destroy
    respond_to do |format|
      format.html { redirect_to product_sales_url, notice: 'Product sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_sale
      @product_sale = ProductSale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_sale_params
      params.require(:product_sale).permit(:product_id, :qty, :value)
    end
end
