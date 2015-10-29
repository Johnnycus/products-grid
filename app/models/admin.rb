class Admin < ActiveRecord::Base
  validates :first_name,  presence: true
  validates :last_name,   presence: true
  validates :birthday,    presence: true
  validates :avatar,       attachment_presence: true
  validates :passport,       attachment_presence: true

  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_attached_file :passport, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :passport, content_type: /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, password_length: 10..128
end
