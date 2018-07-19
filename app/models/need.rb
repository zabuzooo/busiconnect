class Need < ApplicationRecord
	belongs_to :place_field
	# belongs_to :status
	belongs_to :user
end
