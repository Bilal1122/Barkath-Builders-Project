class User < ApplicationRecord
  has_many :jobs, dependent: :destroy

  scope :active, -> { where(deleted_at: nil).order(created_at: :asc)}
  scope :soft_deleted, -> { where.not(deleted_at: nil).order(created_at: :asc)}
end
