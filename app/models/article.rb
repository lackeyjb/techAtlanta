class Article < ActiveRecord::Base

  def self.get_articles
    get_links.map do |line|
      response     = get_summaries(line)
      create_articles(response) unless response.blank?
    end
  end

  def self.create_articles(response)
    self.where(:source).first_or_create( source:   response['data']['url'],
                                         summary:  response['data']['summary'],
                                         keywords: response['data']['keywords'].join(', ') )
  end

  def self.get_links
    response = Unirest.get 'https://www.kimonolabs.com/api/e8fno6vo?apikey=n72dwRbZVmajvWGBgV3wWQuIwmDHGK1i'
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
