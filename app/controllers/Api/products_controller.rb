module Api
  
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]

    # GET /products or /products.json
    def index
      @products = Product.order(created_at: :desc)

      respond_to do |format|
        format.json { render json: @products }
        format.html
      end
    end

    # GET /products/1 or /products/1.json
    def show
      respond_to do |format|
        format.json { render json: @product }
        format.html
      end
    end

    # GET /products/new
    def new
      @product = Product.new
    end

    # GET /products/1/edit
    def edit
    end

    # POST /products or /products.json
    def create
      @product = Product.new(product_params)

      respond_to do |format|
        if @product.save
          format.json { render :show, status: :created, location: api_product_url(@product) }
          format.html { redirect_to api_product_url(@product), notice: "Product was successfully created." }
        else
          format.json { render json: @product.errors, status: :unprocessable_entity }
          format.html { render :new, status: :unprocessable_entity , notice: "Product was not created try again!"}
        end
      end
    end

    # PATCH/PUT /products/1 or /products/1.json
    def update
      respond_to do |format|
        if @product.update(product_params)
          format.json { render :show, status: :ok, location: api_product_url(@product) }
          format.html { redirect_to api_product_url(@product), notice: "Product was successfully updated." }
        else
          format.json { render json: @product.errors, status: :unprocessable_entity }
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /products/1 or /products/1.json
    def destroy
      @product.destroy

      respond_to do |format|
        format.html { redirect_to api_products_url, notice: "Product was successfully destroyed." }
        format.json { render json: @products }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def product_params
        # params.require(:product).permit(:name, :description, :quantity, :price, :product_image) # bu neden form data ile veri yüklerken hata veriyor
        params.permit(:name, :description, :quantity, :price, :product_image)

      end
  end
end
