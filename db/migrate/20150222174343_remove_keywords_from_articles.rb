class RemoveKeywordsFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :keywords
  end
end
