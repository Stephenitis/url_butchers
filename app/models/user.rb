class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  before_save :generate_token

  def generate_token
    self.token = SecureRandom.hex(5)
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end




end
