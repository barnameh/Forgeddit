class Comment < ApplicationRecord
  belongs_to :link
  belongs_to :user

  validates :text, presence: true
end
