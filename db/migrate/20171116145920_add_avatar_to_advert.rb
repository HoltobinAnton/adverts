class AddAvatarToAdvert < ActiveRecord::Migration[5.0]
  def self.up
    add_column :adverts, :avatar, :string
  end

  def self.down
    remove_column :adverts, :avatar
  end

end
