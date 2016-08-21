class RemoveTitleFromProblems < ActiveRecord::Migration[5.0]
  def change
    remove_column :problems, :title
  end
end
