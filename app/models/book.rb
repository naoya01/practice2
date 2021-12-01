class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments
  has_many :favorites,dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user #ここです！
  validates :title, presence: true
  validates :body, presence: true,length: { maximum: 200}
  scope :latest, -> {order(updated_at: :desc)}

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
