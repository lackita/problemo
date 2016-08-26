class User < ApplicationRecord
  has_many :problems

  def unsolved_problems
    problems.where solved: false
  end
end
