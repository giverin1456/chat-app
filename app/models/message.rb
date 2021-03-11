class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  # imageはファイル名

  validates :content, presence: true
end
