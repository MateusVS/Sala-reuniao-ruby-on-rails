require 'rails_helper'
require 'pry'

RSpec.describe Reservation, type: :model do
  context "Reservation valid" do
    it "Is the reservation valid ?" do
      user_attributes = { :name => "Mateus", :email => "mateus@gmail.com", :password => "123456" }
      user = User.create(user_attributes)
      
      reservation = Reservation.new
      reservation.user_id = user.id
      reservation.details = "Some details"
      reservation.date = DateTime.now

      expect(reservation.valid?).to be_truthy
    end

    it "Is the reservation invalidated ?" do
      user_attributes = { :name => "Mateus", :email => "mateus@gmail.com", :password => "123456" }
      user = User.create(user_attributes)

      reservation = Reservation.new
      reservation.user_id = user.id
      reservation.details = "Some details"
      reservation.date = Date.today-Date.today.wday-6

      expect(reservation.valid?).to be_falsey
    end

    it "Is the current user the owner of the reservation?" do
      user_attributes = { :name => "Mateus", :email => "mateus@gmail.com", :password => "123456" }
      user = User.create(user_attributes)

      reservation = Reservation.new
      reservation.user_id = user.id
      reservation.details = "Some details"
      reservation.date = DateTime.now

      user_attributes = { :name => "Pedro", :email => "pedro@gmail.com", :password => "123456" }
      user = User.create(user_attributes)
      

      reservation.check_if_is_current_user(user.id)

      expect { raise "Não é possível editar agendamentos que pertençam a outro usuário" }.to raise_error
    end

  end
end
 