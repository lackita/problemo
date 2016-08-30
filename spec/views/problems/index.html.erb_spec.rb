require "rails_helper"

RSpec.describe "problems/index" do
  it "renders without errors" do
    assign(:problems, [User.create!.problems.create!])
    render
  end
end
