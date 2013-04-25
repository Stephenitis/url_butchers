class Url < ActiveRecord::Base
  after_create :url_shortener
  before_save :url_cleanser

  validates :originalurl, :format => {:with => URI::regexp(%w(http https))}


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

  def url_cleanser
    self.originalurl = self.originalurl.gsub(/.*:\/\//, '')
    p "url cleanser after save"
    p self
    self
  end

end
