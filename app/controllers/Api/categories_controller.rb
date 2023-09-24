module Api
  class CategoriesController < ApplicationController
    before_action :set_category, only: %i[ show edit update destroy ]

    # GET /categories or /categories.json
    def index
      @categories = Category.order(created_at: :desc)
      respond_to do |format|
        format.json { render json: @categories  }
        format.html
      end
    end

    # GET /categories/1 or /categories/1.json
    def show
      respond_to do |format|
        format.json { render json: @category  }
        format.html
      end
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
      @category = Category.new(category_params)

      if @category.valid?
        respond_to do |format|
          if @category.save
            format.json { render :show, status: :created, location: api_product_url(@category) }
            format.html { redirect_to api_category_url(@category), notice: "Category was successfully created." }
          else
            format.json { render json: @category.errors, status: :unprocessable_entity }
            format.html { render :new, status: :unprocessable_entity }
          end
        end
      else
        render json: @category.errors.full_messages, status: 400
      end

    end

    # PATCH/PUT /categories/1 or /categories/1.json
    def update
      respond_to do |format|
        if @category.update(category_params)
          format.html { redirect_to api_category_url(@category), notice: "Category was successfully updated." }
          format.json { render :show, status: :ok, location: @category }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /categories/1 or /categories/1.json
    def destroy
      @category.destroy

      respond_to do |format|
        format.html { redirect_to api_categories_url, notice: "Category was successfully destroyed." }
        format.json { head :no_content }
      end
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


