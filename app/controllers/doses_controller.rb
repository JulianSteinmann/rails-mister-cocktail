# frozen_string_literal: true

class DosesController < ApplicationController
  before_action :set_dose, only: %i[show edit update destroy]

  # GET /doses
  # GET /doses.json
  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = @cocktail.doses
  end

  # GET /doses/1
  # GET /doses/1.json
  def show; end

  # GET /doses/new
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail_id: @cocktail.id)
  end

  # GET /doses/1/edit
  def edit; end

  # POST /doses
  # POST /doses.json
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  def update
    if @dose.update(dose_params)
      redirect_to @dose, notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to doses_url(@cocktail)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dose
    @dose = Dose.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
