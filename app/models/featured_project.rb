class FeaturedProject < ApplicationRecord
  require 'carrierwave/orm/activerecord'
  mount_uploader :attachment, AvatarUploader
end
