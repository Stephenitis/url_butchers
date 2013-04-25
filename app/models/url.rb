class Url < ActiveRecord::Base
  
  before_save :url_cleanser
  before_create :url_shortener
  p self
  validates :originalurl, :format => {:with => URI::regexp(%w(http https))}


  def add_count
    p "adding count #{self.inspect}"
    self.counter += 1
    self.save
  end

  private

  def url_shortener
    update = {}
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    self.shorturl  =  (0...4).map{ o[rand(o.length)] }.join
    self
  end

  def url_cleanser
    self.originalurl = self.originalurl.gsub(/.*:\/\//, '')
    p "url cleanser before save"
    p self
    self
  end
  puts "end of class"
end
