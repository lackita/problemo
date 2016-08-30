class Problem < ApplicationRecord
  belongs_to :user
  has_many :hypotheses

  before_save :default_unsolved
  def default_unsolved
    self.solved ||= false
  end

  def solve
    self.solved = true
    save!
  end
end
