require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET users#new" do
    it "render new template" do
      get '/users/new'
      expect(response).to render_template(:new)
    end
  end

  describe User do
    it "create new user" do
      user = User.new({
        name: "Mateus",
        email: "mateusviniciussilva07@gmail.com",
        password: "123456"
      })
      expect(user).to be_valid
    end
  end 
end
