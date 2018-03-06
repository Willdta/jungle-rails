class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true  
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end