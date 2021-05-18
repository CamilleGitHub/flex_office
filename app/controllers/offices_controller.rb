class OfficesController < ApplicationController
  def index
    @offices = Office.all
  end

  def show
    @office = Office.find(params[:id])
    authorize @office
  end

  def new
    @office = Office.new
    authorize @office
  end

  def create
    @office = Office.new(office_params)
    authorize @office
    @office.user = current_user
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def edit
    @office = Office.find(params[:id])
    authorize @office
  end

  def update
    authorize @office
  end

  private

  def office_params
    params.require(:office).permit(:name, :address, :city, :capacity, :price)
  end
end
