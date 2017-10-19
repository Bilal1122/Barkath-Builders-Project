class Job < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :user
end
