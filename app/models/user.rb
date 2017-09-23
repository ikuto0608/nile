class User < ApplicationRecord
  has_many :reviews, foreign_key: 'reviewee_id'
  has_many :wishlists
  has_many :reviews_as_reviewer, foreign_key: "reviewer_id", class_name: "Review"
  has_many :reviews_as_reviewee, foreign_key: "reviewee_id", class_name: "Review"
  
  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  # has_secure_password :password


end
