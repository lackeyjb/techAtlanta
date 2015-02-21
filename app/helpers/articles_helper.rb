module ArticlesHelper
  def get_name(article)
    article.source.split('/')[-1].titleize.gsub('-', ' ').gsub('.Html', '')
  end

  def get_summary(article)
    article.summary.gsub(/<https?:\/\/[\S]+/, ' ')
  end
end
  