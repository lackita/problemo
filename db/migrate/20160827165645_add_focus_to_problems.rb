class AddFocusToProblems < ActiveRecord::Migration[5.0]
  def change
    add_column :problems, :focus, :boolean
    Problem.all.each do |p|
      p.focus = false
    end
  end
end
