class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @bookings = current_user.bookings

    @bookings_as_owner = current_user.bookings_as_owner
  end
end
