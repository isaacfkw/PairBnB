# Preview all emails at http://localhost:3000/rails/mailers/reservation_notice
class ReservationNoticePreview < ActionMailer::Preview
  def confirmation_email_preview
    ReservationNotice.confirmation_email(User.first)
  end

end
