require 'rails_helper'

RSpec.describe Problem, type: :model do
  it "has a title and description" do
    title = "I need a test"
    description = "Have to make sure tests exist"
    p = Problem.new :title => title, :description => description
    expect(p.title).to eq(title)
    expect(p.description).to eq(description)
  end
end
