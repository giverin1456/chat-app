class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image
  # imageはファイル名

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end


# unlessオプションにメソッド名を指定することで、「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作る
# 画像があればtrue ,  画像がなければfalse