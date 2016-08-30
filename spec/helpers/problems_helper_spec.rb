require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProblemsHelper. For example:
#
# describe ProblemsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProblemsHelper, type: :helper do
  describe "toggle_focus_path" do
    before(:each) do
      @problem = User.create!.problems.create!
    end

    it "has an unfocus path when focused" do
      @problem.focused = true
      expect(toggle_focus_path(@problem)).to eq(unfocus_problem_path(@problem))
    end

    it "has an focus path when unfocused" do
      @problem.focused = false
      expect(toggle_focus_path(@problem)).to eq(focus_problem_path(@problem))
    end
  end
end
