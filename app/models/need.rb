class Need < ApplicationRecord
	belongs_to :purpose
	belongs_to :place_field
	# belongs_to :status
	belongs_to :user
	has_many :matchings
	has_many :notifications, dependent: :destroy
	attachment :image
end