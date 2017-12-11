class Gallery < ApplicationRecord
  mount_uploader :attachment, AvatarUploader
end
