class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, {presence:true}
  validates :user_name, {presence:true}
  validates :user_phonetic, {presence:true}
  validates :postal, {presence:true,numericality: { only_integer: true }}
  validates :address, {presence:true}
  validates :tell, {presence:true, numericality: { only_integer: true }}
  validates_acceptance_of :agreement, on: :confirm

  def active_for_authentication?
    super && !delete_flag?
  end

  has_one :unsubscribe_comment
  has_many :needs
  has_many :matchings
  has_many :notifications, dependent: :destroy
  has_many :contacts
  belongs_to :place_field
  belongs_to :settlement
  belongs_to :type
  attachment :image
end
