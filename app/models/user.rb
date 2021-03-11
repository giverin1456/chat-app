class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  
  validates :name, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
end

# through: :room_user→中間テーブルを経由しますという意味
# なぜ複数形?→複数と繋がっているから