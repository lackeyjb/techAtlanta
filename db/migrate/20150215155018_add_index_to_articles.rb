class AddIndexToArticles < ActiveRecord::Migration
  def change
    add_index :articles, :source, unique: true
  end
end
