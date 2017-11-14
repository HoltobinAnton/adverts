class AddRoleIdToUser < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :users, :role
  end

  def self.down
    remove_reference :users, :role
  end
end
