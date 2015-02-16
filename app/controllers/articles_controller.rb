class ArticlesController < ApplicationController
  def index
    @articles = Article.summaries
  end
end