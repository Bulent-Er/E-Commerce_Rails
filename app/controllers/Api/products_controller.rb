module Api
  class ProductsController < ApplicationController
    before_action :set_product, only: %i[ show edit update destroy ]
    before_action :authenticate_user!
    before_action -> {check_user_roles(RolesType.only_admin_and_super_admin)}, only: [:create, :update, :destroy]
    before_action -> {check_user_roles(RolesType.all_roles)}, only: [:index, :show]


    # after_action  :test_method, only: [ :create ] #bu şekilde de kullanabiliriz

    # GET /products or /products.json
    def index
      # authorize(@product)
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
      # authorize(@product)
      render "show"
      # respond_to do |format|
      #  image = rails_blob_url(@product.product_image) if @product.product_image.present?
      #  render "show"
      #  format.json { render json: { data: { product: @product, category: @product.category}, image: image } }
      #  format.html
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
      @product = Product.create(product_params)
      authorize(@product)
      if @product.valid?
        @product = Product.create(product_params)
        if @product.valid?
          render :create
        else
          handle_error
          # render :error, status: :unprocessable_entity 
        end
      end
    end

    # PATCH/PUT /products/1 or /products/1.json
    def update
      authorize(@product)
      if @product.update(product_params)
        render :update, status: :ok
      else
        handle_error
        # render :error, status: :unprocessable_entity 
      end
    end

    # DELETE /products/1 or /products/1.json
    def destroy
      authorize(@product)
      if @product.destroy
      render :destroy, status: :ok
      else
        handle_error
        # render :error, status: :bad_request 
      end
    end

    def get_by_name
      @products = Product.where(name: params[:name]).order(created_at: :desc)
      if @products.present?
        render  "index"
      else
        @message = "No products was found searching by name"
        render json:  @message
      end
    end

    def handle_error
      render :error, status: :bad_request
    end

    # def test_method
    #   p "test mothod run and new product created".center(100, "*")
    #   byebug #continue ile devam edebilrsin
    # end

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
