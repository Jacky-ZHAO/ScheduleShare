class AddInformationToUser < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :birthday, :timestamp
    add_column :users, :motto, :string
  end
end
