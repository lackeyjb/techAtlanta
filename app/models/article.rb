class Article < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  def self.get_links
    response = Unirest.get 'https://www.kimonolabs.com/api/e8fno6vo?apikey=n72dwRbZVmajvWGBgV3wWQuIwmDHGK1i'
    links    = response.body['results']['Links'].map { |line| line['link']['href'] }
    # to format link for summarizer api
    links.map { |link| URI.encode(link, /\W/) }
  end

  def self.get_summaries(link)
    response = Unirest.get "https://tldr.p.mashape.com/summary?url=#{link}",
               headers:{ "X-Mashape-Key" => "ImtiUAEPvKmshKFfEEEW3HO1AaxVp1g8aPojsnoIKvv5qslyfU",
                         "Accept"        => "application/json" }
    response.body
  end

  def self.create_articles(response)
    article = self.find_by(source: response['data']['url'])
    if article.nil?
      self.create( source:   response['data']['url'],
                   summary:  response['data']['summary'])                   
    end
  end

  def self.grab_new
    get_links.map do |line|
      response     = get_summaries(line)
      create_articles(response) unless response.blank?
    end
  end
   
end
