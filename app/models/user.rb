class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :provider, :uid, :email, :full_name, :image, :location, :nickname, :urls

  # === setting a omniauth
  # return::void
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider  = auth["provider"]
      user.uid       = auth["uid"]
      user.email     = auth["info"]["email"]
      user.full_name = auth["info"]["full_name"]
      user.image     = auth["info"]["image"]
      user.location  = auth["info"]["location"]
      user.nickname  = auth["info"]["nickname"]
      user.urls      = auth["info"]["urls"]["yammer"]
    end
  end
end
