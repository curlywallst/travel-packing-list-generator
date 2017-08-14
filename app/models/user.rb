class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :trips
  has_many :categories, through: :trips
  #
  # def self.from_omniauth(auth) where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #   end
  # end

  devise :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth) where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def trips_in_category(category)
    self.trips.select{ |e| e.category.id == category.id }.uniq
  end



end
