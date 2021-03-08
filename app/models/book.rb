class Book < ApplicationRecord
  belongs_to :user
    # validate :title, presence: true
    # validate :body, presence: true, length: { maximum: 200 }
end
