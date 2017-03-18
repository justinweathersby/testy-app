class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { medium: "300x300", small: "100x100>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  before_create :assign_default_role
  before_create :generate_auth_token

  belongs_to :dealership

  def generate_auth_token
    loop do
      self.auth_token = Devise.friendly_token
      break self.auth_token unless User.where(auth_token: self.auth_token).first
    end
  end

   def assign_default_role
     self.add_role(:customer) if self.roles.blank?
   end
end
