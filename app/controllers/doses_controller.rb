class DosesController < ApplicationController
  before_action :set_cocktail_id, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # save dose to that instance of cocktail
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail), notice: "This dosage has been deleted."
  end

  private

  def set_cocktail_id
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:amount, :description, :ingredient_id)
  end
end
