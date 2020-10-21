class Item < ApplicationRecord
belongs to :user
has_one :purchase
has_one_attached :image

end
