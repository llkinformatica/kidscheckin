class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |usuario|
        usuario.email = auth.info.email
        usuario.password = Devise.friendly_token[0, 20]
        usuario.full_name = auth.info.name # assuming the user model has a name
        usuario.avatar_url = auth.info.image # assuming the user model has an image
        usuario.codigo = rand 999999
    end
  end

  has_many :checkins, :foreign_key => "uid", 
                   :primary_key => "uid"  

end
