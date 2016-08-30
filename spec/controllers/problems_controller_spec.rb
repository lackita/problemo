require 'rails_helper'

RSpec.describe ProblemsController, type: :controller do
  before(:each) do
    @user = User.create!
    @problem = @user.problems.create!
    @request.env['HTTP_REFERER'] = "/"
  end

  describe "POST solve" do
    it "marks problem solved" do
      session[:user_id] = @user.id.to_s
      post :solve, id: @problem.id
      @problem.reload
      expect(@problem).to be_solved
    end

    it "does not mark problem for wrong user solved" do
      post :solve, id: @problem.id
      @problem.reload
      expect(@problem).to_not be_solved
    end
  end

  describe "POST focus" do
    it "marks problem focused" do
      session[:user_id] = @user.id.to_s
      post :focus, id: @problem.id
      @problem.reload
      expect(@problem).to be_focused
    end

    it "does not mark problem for wrong user focused" do
      post :focus, id: @problem.id
      @problem.reload
      expect(@problem).to_not be_focused
    end
  end

  describe "POST unfocus" do
    before(:each) do
      @problem.focused = true
      @problem.save!
    end

    it "marks problem unfocused" do
      session[:user_id] = @user.id.to_s
      post :unfocus, id: @problem.id
      @problem.reload
      expect(@problem).to_not be_focused
    end

    it "does not mark problem unfocused for wrong user" do
      post :unfocus, id: @problem.id
      @problem.reload
      expect(@problem).to be_focused
    end
  end
end
