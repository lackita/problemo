require 'rails_helper'

RSpec.describe Problem, type: :model do
  it "has a title and description" do
    description = "Have to make sure tests exist"
    p = Problem.new :description => description
    expect(p.description).to eq(description)
  end
end
