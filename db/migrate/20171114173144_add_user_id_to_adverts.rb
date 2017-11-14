class AddUserIdToAdverts < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :adverts, :user
  end

  def self.down
    remove_reference :adverts, :user
  end
end
