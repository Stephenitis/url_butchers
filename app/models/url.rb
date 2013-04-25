class Url < ActiveRecord::Base
  after_create :url_shortener
  def add_count
    p "adding count #{self.inspect}"
    self.counter += 1
    self.save
  end

  private

  def url_shortener
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    self.shorturl  =  (0...4).map{ o[rand(o.length)] }.join
    self.save
  end

end


