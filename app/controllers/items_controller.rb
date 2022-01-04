class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET categories/:category_id/items/1 or /items/1.json
  def show
    @category = Category.find(params[:category_id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST category/:category_id/items or /items.json
  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.create(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @category.month, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item.category.month, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @category = @item.category
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @category.month, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :planned, :remaining, :is_fund, :category_id)
    end
end
