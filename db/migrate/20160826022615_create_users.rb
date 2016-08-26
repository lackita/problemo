class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.integer :google_uid, limit: 16

      t.timestamps
    end
  end
end
