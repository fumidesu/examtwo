class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable
         mount_uploader :avatar, AvatarUploader

  #group :development do
  #  gem 'letter_opener_web'
  #end

  mount_uploader :avatar, AvatarUploader
  has_many :fotos
  def self.find_for_twitter_oauth(auth, signed_in_resource = nil)
   user = User.find_by(provider: auth.provider, uid: auth.uid)

   unless user
     user = User.new(
         name:     auth.info.nickname,
         image_url: auth.info.image,
         provider: auth.provider,
         uid:      auth.uid,
         email:    auth.info.email ||= "#{auth.uid}-#{auth.provider}@example.com",
         password: Devise.friendly_token[0, 20]
     )
     user.skip_confirmation!
     user.save
   end
   user
 end
  def self.create_unique_string
    SecureRandom.uuid
  end
end
