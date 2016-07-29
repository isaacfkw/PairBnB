class ReservationsController < ApplicationController

def create

	@reservation = Reservation.new(reservation_params)
	@listing = @reservation.listing
	@host = @listing.user
	@user = current_user
	# byebug
	if (@reservation.reserved_dates & @listing.taken_dates).empty?
		@reservation.save
		ReservationNotice.confirmation_email(@user).deliver!
		BookingEmail.booking_notice_email(@host, @listing, @user).deliver!
		flash[:success] = 'Booking confirmed fxxker!'
		redirect_to listing_path(@listing)
	else
		flash[:error] = 'WTF you did? Booking failed!'
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
