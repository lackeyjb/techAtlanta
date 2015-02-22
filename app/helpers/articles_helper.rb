module ArticlesHelper
  def get_title(article)
    title = article.source.split('/')[-1].titleize.gsub('-', ' ').gsub('.Html', '')
    link_to truncate(title, length: 30, separator: ' '), article.source, target: '_blank'
  end

  def get_summary(article)
    article.summary.gsub(/<https?:\/\/[\S]+/, ' ')
  end

  def get_favorite(article, already_saved, full_heart, heart)
    if signed_in?
      if already_saved.include? article.source
        full_heart
      else
        heart
      end
    end
  end

  def link_to_heart(heart, article )
    link_to content_tag(:i, nil, class: heart),
    favorites_path(favorite: { article_id: article.id }),
    method: :post
  end
end

  