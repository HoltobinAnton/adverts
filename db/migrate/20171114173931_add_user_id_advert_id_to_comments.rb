class AddUserIdAdvertIdToComments < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :comments, :user
    add_reference :comments, :advert
  end

  def self.down
    remove_reference :comments, :user
    remove_reference :comments, :advert
  end
end
