require 'rails_helper'

RSpec.describe HypothesesController, type: :controller do
  describe "POST create" do
    before(:each) do
      @user = User.create!
      @problem = @user.problems.create!
      @request.env['HTTP_REFERER'] = "/"
      session[:user_id] = @user.id
    end

    it "creates a hypothesis" do
      post :create, hypothesis: {problem_id: @problem.id.to_s,
                                 description: "foo"}
      @problem.reload
      expect(@problem.hypotheses.length).to eq(1)
    end

    it "doesn't create a hypothesis for the wrong user" do
      session[:user_id] = "-1"
      post :create, hypothesis: {problem_id: @problem.id,
                                 description: "foo"}
      @problem.reload
      expect(@problem.hypotheses).to be_empty
    end

    it "doesn't create a hypothesis for an empty string" do
      post :create, hypothesis: {problem_id: @problem.id,
                                 description: ""}
      expect(@problem.hypotheses.length).to eq(0)
    end
  end
end
