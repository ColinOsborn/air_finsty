class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Validations
  validates :fullname, presence: true, length: { maximum: 50 }
  # Associations
  has_many :rentals

  def self.from_omniauth(auth)
    user = User.find_by(email: auth.info.email).first
    # ensure this will behave how we want vs where(email: auth.info.email)
    if user
      return user
    else
      where(provider: auth_provider, uid: auth.uid).first_or_create do |user|
        user.email =    auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.fullname = auth.info.name
        user.image =    auth.info.image
        user.uid =      auth.uid
        user.provider = auth.provider

        user.skip_confirmation!
      end
    end
  end
end
