class PostAttachment < ApplicationRecord
   mount_uploader :avatar, AvatarUploader
   belongs_to :advert
end
