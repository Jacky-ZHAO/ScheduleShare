class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.timestamp :time
      t.string :venue
      t.text :description
      t.string :people
      t.string :title

      t.timestamps
    end
	add_index :events, [:user_id, :created_at]
  end
end
