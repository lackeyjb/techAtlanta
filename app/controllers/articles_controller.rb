class ArticlesController < ApplicationController
  before_action :signed_in_user
  def index
    @articles = Article.all
  end
end