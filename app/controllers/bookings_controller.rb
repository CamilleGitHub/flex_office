class BookingsController < ApplicationController
  def new
    @office = Office.find(params[:office_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @office = Office.find(params[:office_id])
    @booking.office = @office
    @booking.user = current_user
    @booking.status = "pending"
    @booking.total_price = @office.price * ((@booking.end_date - @booking.start_date) + 1)
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    @office = @booking.office
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to root_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
  end

  def accept
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to dashboard_path
  end

  def decline
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = "declined"
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
