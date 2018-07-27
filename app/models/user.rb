class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :unsubscribe_comment
  has_many :needs
  has_many :matchings
  has_many :notifications, dependent: :destroy
  belongs_to :place_field
  belongs_to :settlement
  belongs_to :type
  attachment :image
end
