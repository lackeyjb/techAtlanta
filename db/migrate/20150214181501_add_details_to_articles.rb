class AddDetailsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :summary, :text
    add_column :articles, :source, :string
  end
end
