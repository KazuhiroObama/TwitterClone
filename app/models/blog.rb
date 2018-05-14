class Blog < ApplicationRecord
  validates  :content, presence: true, length: { maximum: 140 }
  belongs_to :user, optional: true
  has_many :favorites_users, through: :favorites, source: :user
end
