class PruductsController < ApplicationController
  before_action :set_pruduct, only: %i[ show edit update destroy ]

  # GET /pruducts or /pruducts.json
  def index
    @pruducts = Pruduct.all
  end

  # GET /pruducts/1 or /pruducts/1.json
  def show
  end

  # GET /pruducts/new
  def new
    @pruduct = Pruduct.new
  end

  # GET /pruducts/1/edit
  def edit
  end

  # POST /pruducts or /pruducts.json
  def create
    @pruduct = Pruduct.new(pruduct_params)

    respond_to do |format|
      if @pruduct.save
        format.html { redirect_to pruduct_url(@pruduct), notice: "Pruduct was successfully created." }
        format.json { render :show, status: :created, location: @pruduct }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pruduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pruducts/1 or /pruducts/1.json
  def update
    respond_to do |format|
      if @pruduct.update(pruduct_params)
        format.html { redirect_to pruduct_url(@pruduct), notice: "Pruduct was successfully updated." }
        format.json { render :show, status: :ok, location: @pruduct }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pruduct.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pruducts/1 or /pruducts/1.json
  def destroy
    @pruduct.destroy

    respond_to do |format|
      format.html { redirect_to pruducts_url, notice: "Pruduct was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pruduct
      @pruduct = Pruduct.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pruduct_params
      params.require(:pruduct).permit(:name, :description, :quantity, :price)
    end
end
