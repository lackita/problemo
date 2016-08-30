require 'rails_helper'

RSpec.describe HypothesesController, type: :controller do
  describe "POST create" do
    before(:each) do
      @user = User.create!
      @problem = @user.problems.create!
      @request.env['HTTP_REFERER'] = "/"
    end

    it "creates a hypothesis" do
      session[:user_id] = @user.id.to_s
      post :create, hypothesis: {problem_id: @problem.id,
                                 description: "foo"}
      @problem.reload
      expect(@problem.hypotheses.length).to be(1)
    end

    it "doesn't create a hypothesis for the wrong user" do
      session[:user_id] = "-1"
      post :create, hypothesis: {problem_id: @problem.id,
                                 description: "foo"}
      @problem.reload
      expect(@problem.hypotheses).to be_empty
    end
  end
end
