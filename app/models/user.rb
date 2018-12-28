class User < ApplicationRecord

  before_create :generate_token

  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  has_secure_password

  def generate_token
    token_generated = SecureRandom.urlsafe_base64
    token_encrypted = Digest::SHA1.hexdigest(token_generated.to_s)
    self.login_token = token_encrypted
  end
end
