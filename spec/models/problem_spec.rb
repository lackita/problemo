require 'rails_helper'

RSpec.describe Problem, type: :model do
  context "unsolved" do
    it "includes new" do
      p = Problem.new
      p.save!
      expect(Problem.unsolved).to include(p)
    end

    it "excludes solved" do
      p = Problem.new
      p.save!
      p.solve
      expect(Problem.unsolved).not_to include(p)
    end
  end
end
