class AddUserIdToAddress < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :addresses, :user
  end

  def self.down
    remove_reference :addresses, :user
  end
end
