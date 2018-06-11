class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @products = Product.all
    @clients = Client.all
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    params['sale']["date"] = Date.today
    @sale = Sale.new(sale_params)
    binding.pry
    sale_save = @sale.save
    if sale_save
      items = params["items"]
      items.each do |item|
        prod = SaleProduct.create(product_id: items[item]["id"], qty: items[item]["qty"], sale_id: @sale.id, value: items[item]["value"])
        Stock.generate_sale(prod)
      end
    end

    respond_to do |format|
      if sale_save
        format.html { redirect_to @sale, notice: 'Venda gravada com sucesso' }
        format.json { render :show, status: :created, location: @sale }
      else 
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.sale_products.delete_all
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:date, :value, :client_id)
    end
end
