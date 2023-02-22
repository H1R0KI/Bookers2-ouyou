class Book < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200}

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.looks(searche, word)
    if search == "perfect_match"
      @book = Book.where("name LIKE?", "#{word}")
    elsif search == "forword_match"
      @book = Book.where("name LIKE?", "#{word}%")
    elsif search == "backword_match"
      @book = Book.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      @book = Book.where("name LIKE?", "%#{word}%")
    else
      @book = Book.all
    end
  end
end
