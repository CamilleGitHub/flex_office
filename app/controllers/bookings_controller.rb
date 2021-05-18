class BookingsController < ApplicationController
  def new
    @office = Office.find(params[:office_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @office = Office.find(params[:office_id])
    @booking.office = @office
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
