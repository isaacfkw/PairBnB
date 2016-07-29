class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :listing

  def reserved_dates
  	(self.start_date..self.end_date).to_a
  end

end
