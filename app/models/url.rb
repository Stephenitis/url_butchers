class Url < ActiveRecord::Base
  before_save :url_shortener
  def add_count
    self.counter += 1
  end
  private

  def url_shortener
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    self.shorturl  =  (0...4).map{ o[rand(o.length)] }.join
  end

end


