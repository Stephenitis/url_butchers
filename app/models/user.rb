class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  before_save :generate_token

  def generate_token
    o =  [('a'..'z'),('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    self.token  =  (0...30).map{ o[rand(o.length)] }.join
  end

  def password
    @password ||= Password.new(self.password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end




end
