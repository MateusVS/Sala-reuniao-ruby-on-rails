require 'rails_helper'

RSpec.describe User, type: :model do
  context "User validate" do
    it "Is the user validate?" do
      user = User.new
      user.name = "Mateus"
      user.email = "mateus@gmail.com"
      user.password = "123456"

      expect(user.valid?).to be_truthy
    end

    it "Is the user invalidated?" do
      user = User.new
      user.name = "Mateus"
      user.email = "mateus@gmail"
      user.password = "123456"

      expect(user.valid?).to be_falsey
    end

    it "Is email unique?" do
      user = User.new
      user.name = "Mateus"
      user.email = "mateus@gmail.com"
      user.password = "123456"

      user.save

      user2 = User.new
      user2.name = "Mateus2"
      user2.email = "mateus@gmail.com"
      user2.password = "123456"

      expect(user2).not_to be_valid
    end
  end
end
