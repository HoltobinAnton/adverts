class AddAvatarToComments < ActiveRecord::Migration[5.0]
  def self.up
    add_column :comments, :avatar, :string
  end

  def self.down
    remove_column :comments, :avatar
  end
end
