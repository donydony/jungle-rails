class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, maximum: 20 }

  def self.authenticate_with_credentials(email, password)
    email = User.trim(email)
    @user = User.find_by('email ILIKE ?', email)
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

  private
  def self.trim(email)
    email = email.strip
  end
end