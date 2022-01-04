class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET month/:month_id/categories or month/:month_id/categories.json
  def index
    @month = Month.find(params[:month_id])
    @categories = @month.categories
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET month/:month_id/categories/new
  def new
    @month = Month.find(params[:month_id])
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST month/:month_id/categories or month/:month_id/categories.json
  def create
    @month = Month.find(params[:month_id])
    @category = @month.categories.create(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @month, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @month = @category.month
    @category.destroy

    respond_to do |format|
      format.html { redirect_to month_categories_url(@month), notice: "Category was successfully destroyed." }
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
      params.require(:category).permit(:name, :month_id)
    end
end
