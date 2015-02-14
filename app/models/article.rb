class Article < ActiveRecord::Base

  def self.get_articles
    kimono_api.map do |line|
      response  = clipped_api(line)
      a         = self.new 
      a.title   = get_attributes(response, 'title')
      a.summary = get_attributes(response, 'summary') unless blank?
      a.source  = get_attributes(response, 'source')
      a.save
    end
    self.select(&:persisted?)
  end

  def self.kimono_api
    response = JSON.parse(RestClient.get 'https://www.kimonolabs.com/api/6hcdd072?apikey=n72dwRbZVmajvWGBgV3wWQuIwmDHGK1i')
    response['results']['Links'].map { |line| line['link']['href'] }
  end

  def self.clipped_api(line)
    RestClient.get "http://clipped.me/algorithm/clippedapi.php?url=#{line}"
  end

  def self.get_attributes(kimono, attribute)
    data = JSON.parse(kimono.scan(/\{.*}/).first)[attribute]
    data.kind_of?(Array) ? data.join : data
  end  
end
