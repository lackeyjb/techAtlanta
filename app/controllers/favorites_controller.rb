class FavoritesController < ApplicationController

  def create
    article = Article.find(favorite_params[:article_id])
    current_user.articles << article unless current_user.articles.include?(article)
    redirect_to :back
  end

  private

    def favorite_params
      params.require(:favorite).permit(:article_id)
    end

end