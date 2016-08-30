class RenameFocusToFocused < ActiveRecord::Migration[5.0]
  def change
    rename_column :problems, :focus, :focused
  end
end
