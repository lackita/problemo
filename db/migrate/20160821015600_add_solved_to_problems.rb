class AddSolvedToProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :problems, :solved, :boolean
    Problem.find_each do |p|
      p.solved = false
      p.save!
    end
  end
end
