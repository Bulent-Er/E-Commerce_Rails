module Api
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]
    before_action :authenticate_user!

    # GET /categories or /categories.json
    def index
      @categories = Category.order(created_at: :desc)
      render :index
    end

    # GET /categories/1 or /categories/1.json
    def show
      render :show
    end

    # GET /categories/new
    def new
      @category = Category.new
    end

    # GET /categories/1/edit
    def edit
    end

    # POST /categories or /categories.json
    def create
      @category = Category.create(category_params)
      if @category.valid?
        render :create
      else
        render :error, status: 400
      end
    end

    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      if @category.update(category_params)
        render :update, status: :ok
      else
        render :error, status: :unprocessable_entity 
      end
    end

    # DELETE /categories/1 or /categories/1.json
    def destroy
      @category.destroy
      render :destroy, status: :ok
    end
    private 
    
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
  end
end

