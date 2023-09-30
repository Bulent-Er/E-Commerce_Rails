module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
    after_action  :test_method, only: [ :create ] #bu şekilde de kullanabiliriz

    # GET /products or /products.json
    def index
      @products = Product.order(created_at: :desc)
      render :index
       # binding.irb
      # respond_to do |format|
      #   format.json { render json: { data: { product: @product, category: @product&.category_id}, image: image } }
      #   format.html
      # end
    end

    # GET /products/1 or /products/1.json
    def show
      respond_to do |format|
       image = rails_blob_url(@product.product_image) if @product.product_image.present?
       format.json { render json: { data: { product: @product, category: @product.category}, image: image } }
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

      if @product.valid?
        respond_to do |format|
          if @product.save
            format.json { render :show, status: :created, location: api_product_url(@product) }
            format.html { redirect_to api_product_url(@product), notice: "Product was successfully created." }
          else
            format.json { render json: @product.errors, status: :unprocessable_entity }
            format.html { render :new, status: :unprocessable_entity , notice: "Product was not created try again!"}
          end
        end
      else
        render json: @product.errors.full_messages, status: 400
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

    def test_method
      p "test mothod run and new product created".center(100, "*")
      # byebug #continue ile devam edebilrsin
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
        # p "before_action method has run".center(10, "@")
        # byebug #continue ile devam edebilrsin
      end

      # Only allow a list of trusted parameters through.
      def product_params
        params.require(:product).permit(:name, :description, :quantity, :price, :product_image, :category_id)
      end
  end
end
