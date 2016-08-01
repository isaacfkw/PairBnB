class ReservationsController < ApplicationController

def create

	@reservation = Reservation.new(reservation_params)
	@listing = @reservation.listing
	@host = @listing.user
	@user = current_user
	# byebug
	if (@reservation.reserved_dates & @listing.taken_dates).empty?
		@reservation.save
		ReservationNotice.delay.confirmation_email(@user)
		BookingEmail.delay.booking_notice_email(@host, @listing, @user)
		flash[:success] = 'Booking confirmed!'
		redirect_to listing_path(@listing)
	else
		flash[:error] = 'Booking failed!'
		redirect_to listing_path(@listing)
	end

end

def show
end

private
	def reservation_params #whitelist of parameters that can enter ur database
		params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date)
	end
end
