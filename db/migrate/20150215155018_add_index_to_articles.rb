class AddIndexToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :source, :string
    add_index :articles, :source, unique: true
  end
end
