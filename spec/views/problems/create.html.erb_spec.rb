require "rails_helper"

RSpec.describe "problems/create" do
  it "renders without errors" do
    assign(:new_problem, Problem.new)
    render
  end
end
