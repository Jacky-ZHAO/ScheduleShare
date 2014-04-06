class RemoveInformationFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :birthday, :timestamp
  end
end
