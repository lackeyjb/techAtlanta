module UsersHelper
  def get_title(article)
    title = article.source.split('/')[-1].titleize.gsub('-', ' ').gsub('.Html', '')
    link_to truncate(title, length: 30, separator: ' '), article.source, target: '_blank'
  end

  def get_summary(article)
    article.summary.gsub(/<https?:\/\/[\S]+/, ' ')
  end
end