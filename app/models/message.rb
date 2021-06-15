class Message < ApplicationRecord

  belongs_to :post
  belongs_to :user


  validates :text, presence: true
  validates :post_id, presence: true
  # validates :user_id, presence: true

  # def was_attached?
  #   self.image.attached?
  # end
end
