class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:facebook]

  has_many :restaurants

  # def self.sign_in_from_omniauth(auth)
  #   find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  # end

  # def self.create_user_from_omniauth(auth)
  #   create(
  #       provider: auth['provider'],
  #       uid: auth['uid'],
  #       name: auth['info']['name']
  #     )
  # end

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

  # def self.new_with_session(params, session)
  #   if session["devise.user_attributes"]
  #     new(session["devise.user_attributes"], without_protection: true) do |user|
  #       user.attributes = params
  #       user.valid?
  #     end
  #   else
  #     super
  #   end
  # end

  # def password_required?
  #   super && provider.blank?
  # end
end
