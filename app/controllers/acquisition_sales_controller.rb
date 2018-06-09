class AcquisitionProductsController < ApplicationController
  before_action :set_acquisition_product, only: [:show, :edit, :update, :destroy]

  # GET /acquisition_products
  # GET /acquisition_products.json
  def index
    @acquisition_products = AcquisitionProduct.all
  end

  # GET /acquisition_products/1
  # GET /acquisition_products/1.json
  def show
  end

  # GET /acquisition_products/new
  def new
    @acquisition_product = AcquisitionProduct.new
  end

  # GET /acquisition_products/1/edit
  def edit
  end

  # POST /acquisition_products
  # POST /acquisition_products.json
  def create
    @acquisition_product = AcquisitionProduct.new(acquisition_product_params)

    respond_to do |format|
      if @acquisition_product.save
        format.html { redirect_to @acquisition_product, notice: 'Acquisition sale was successfully created.' }
        format.json { render :show, status: :created, location: @acquisition_product }
      else
        format.html { render :new }
        format.json { render json: @acquisition_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acquisition_products/1
  # PATCH/PUT /acquisition_products/1.json
  def update
    respond_to do |format|
      if @acquisition_product.update(acquisition_product_params)
        format.html { redirect_to @acquisition_product, notice: 'Acquisition sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @acquisition_product }
      else
        format.html { render :edit }
        format.json { render json: @acquisition_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acquisition_products/1
  # DELETE /acquisition_products/1.json
  def destroy
    @acquisition_product.destroy
    respond_to do |format|
      format.html { redirect_to acquisition_products_url, notice: 'Acquisition sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acquisition_product
      @acquisition_product = AcquisitionProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acquisition_product_params
      params.require(:acquisition_product).permit(:product_id, :qty, :value)
    end
end
