require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET index" do
    it "redirects to focused when logged in" do
      @user = User.create!
      session[:user_id] = @user.id
      response = get :index
      expect(response).to redirect_to("/focused")
    end
  end

  describe "GET focused" do
    it "gets a list of focused problems" do
      @user = User.create!
      session[:user_id] = @user.id
      get :focused
    end
  end

  describe "GET all" do
    it "gets a list including unfocused problems" do
      @user = User.create!
      session[:user_id] = @user.id
      get :all
    end
  end
end
