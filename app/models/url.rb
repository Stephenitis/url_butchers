require 'SecureRandom'
class Url < ActiveRecord::Base
  before_save :url_shortener
  def add_count
    self.counter += 1
  end
  private

  def url_shortener
    self.shorturl = SecureRandom.hex(2)
  end

end


