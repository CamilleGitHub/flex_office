class OfficesController < ApplicationController
  def index
    @offices = Office.all
  end

  def show
    @office = Office.find(params[:id])
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)
    @office.user = current_user
    if @office.save
      redirect_to office_path(@office)
    else
      render :new
    end
  end

  def edit
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])
    @office.update(office_params)
    redirect_to office_path(@office)
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy
  end

  private

  def office_params
    params.require(:office).permit(:name, :address, :city, :capacity, :price)
  end
end
