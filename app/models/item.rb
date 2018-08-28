class Item < ApplicationRecord
	# belongs_to :user
	validates :name, presence: true, length: { maximum: 150 }
	validates :ISBN, length: { is: 17 }, allow_blank: true, allow_nil: true
end
