class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
end
