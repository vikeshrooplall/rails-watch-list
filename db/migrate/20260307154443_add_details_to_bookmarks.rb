class AddDetailsToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :comment, :text
    add_reference :bookmarks, :movie, null: false, foreign_key: true
    add_reference :bookmarks, :list, null: false, foreign_key: true
  end
end
