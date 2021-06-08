class Room < ApplicationRecord

  belongs_to :post
  has_many   :message

end
