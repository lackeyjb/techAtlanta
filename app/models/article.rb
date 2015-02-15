class Article < ActiveRecord::Base

  def self.get_articles
    get_links.map do |line|
      response   = stremor_api(line)
      a          = self.new 
      a.source   = response['data']['url']
      a.summary  = response['data']['summary']
      a.keywords = response['data']['keywords'].join(', ')
      a.save
    end
    self.select(&:persisted?)
  end

  def self.get_links
    response = Unirest.get 'https://www.kimonolabs.com/api/6hcdd072?apikey=n72dwRbZVmajvWGBgV3wWQuIwmDHGK1i'
    links    = response.body['results']['Links'].map { |line| line['link']['href'] }
    # to format link for summarizer api
    links.map { |link| link.gsub!('/', '%2F').sub!(':', '%3A') }
  end

  def self.get_summaries(link)
    response = Unirest.get "https://tldr.p.mashape.com/summary?url=#{link}",
               headers:{ "X-Mashape-Key" => "ImtiUAEPvKmshKFfEEEW3HO1AaxVp1g8aPojsnoIKvv5qslyfU",
                         "Accept"        => "application/json" }
    response.body
  end 
end
