class ArticlesController < ApplicationController
  def index
    @articles = Article.paginate(page: params[:page], per_page: 6).order('created_at DESC')
    @already_saved_articles = current_user.articles.map(&:source) unless current_user.nil?
  end

end