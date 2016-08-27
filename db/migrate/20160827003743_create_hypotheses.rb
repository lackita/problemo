class CreateHypotheses < ActiveRecord::Migration[5.0]
  def change
    create_table :hypotheses do |t|
      t.integer :problem_id
      t.string :description

      t.timestamps
    end
  end
end
