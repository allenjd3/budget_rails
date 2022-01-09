class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /transactions or /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
  end

  # GET /items/:item_id/transactions/new
  def new
    if params.has_key?(:item_id)
      @item = Item.find(params[:item_id])
    else
      @item = Item.new
    end
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST items/:item_id/transactions or /transactions.json
  def create
    ActiveRecord::Base.transaction do
      if params.has_key?(:item_id)
        @item = Item.find(params[:item_id])
        @transaction = @item.transactions.new(transaction_params)
      else
        @transaction = Transaction.new(transaction_params)
        @item = Item.find(transaction_params[:item_id])
      end

      respond_to do |format|
        if @transaction.save
          format.html { redirect_to @transaction.item.category.month, notice: "Transaction was successfully created." }
          format.json { render :show, status: :created, location: @transaction }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @transaction.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction.item.category.month, notice: "Transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @month = @transaction.item.category.month
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to month_path(@month), notice: "Transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:name, :item_id, :spent, :spent_date)
    end
end
