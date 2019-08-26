class Superadmin < ApplicationRecord
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
  # Either create a User record or update it based on the provider (Google) and the UID
  where(provider: auth.provider, uid: auth.uid).first_or_create do |superadmin|
    superadmin.token = auth.credentials.token
    superadmin.expires = auth.credentials.expires
    superadmin.expires_at = auth.credentials.expires_at
    superadmin.refresh_token = auth.credentials.refresh_token
    end
  end

end
