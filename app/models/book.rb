class Book < ApplicationRecord
  belongs_to :user
    validates :title, presence: true
    validates :body, length: { in: 1..200 }

  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
