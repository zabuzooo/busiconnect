class Matching < ApplicationRecord
	belongs_to :user
    belongs_to :need
    has_many :notifications, dependent: :destroy
end