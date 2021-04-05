require 'rails_helper'

RSpec.describe Reservation, type: :model do
  context "Reservation valid" do
    it "Is the reservation valid ?" do
      reservation = Reservation.new
      reservation.user_id = 1
      reservation.details = "Some details"
      reservation.date = DateTime.now

      expect(reservation.valid?).to be_truthy
    end

    it "Is the reservation invalidated?" do
      reservation = Reservation.new
      reservation.user_id = 1
      reservation.details = "Some details"
      reservation.date = Time.now

      expect(reservation.valid?).to be_falsey
    end
  end
end
 