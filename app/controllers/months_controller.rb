class MonthsController < ApplicationController
  before_action :set_month, only: %i[ show edit update destroy ]

  # GET /teams/:team_id/months or teams/:team_id/months.json
  def index
    @team = Team.find(params[:team_id])
    @months = @team.months
  end

  # GET /months/1 or /months/1.json
  def show
  end

  # GET /teams/:team_id/months/new
  def new
    @team = Team.find(params[:team_id])
    @month = Month.new
  end

  # GET /months/1/edit
  def edit
  end

  # POST /teams/:team_id/months or /months.json
  def create
    @team = Team.find(params[:team_id])
    @month = @team.months.create(month_params)

    respond_to do |format|
      if @month.save
        format.html { redirect_to month_url(@month), notice: "Month was successfully created." }
        format.json { render :show, status: :created, location: @month }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /months/1 or /months/1.json
  def update
    respond_to do |format|
      if @month.update(month_params)
        format.html { redirect_to month_url(@month), notice: "Month was successfully updated." }
        format.json { render :show, status: :ok, location: @month }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /months/1 or /months/1.json
  def destroy
    @team = @month.team
    @month.destroy

    respond_to do |format|
      format.html { redirect_to team_months_url(@team), notice: "Month was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_month
      @month = Month.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def month_params
      params.require(:month).permit(:month, :monthly_planned, :team_id)
    end
end
