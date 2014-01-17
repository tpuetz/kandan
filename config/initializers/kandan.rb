Dir["#{Rails.root}/lib/broadcasters/**/*.rb"].each do |file|
  require file
end

module Kandan
  def self.devise_modules
    standard = [:database_authenticatable, :registerable,
                :recoverable, :rememberable, :trackable, :validatable,
                :token_authenticatable, :omniauthable, :omniauth_providers => [:google_oauth2]]
  end
end

