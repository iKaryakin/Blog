class ChangeIdToComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :article_id
    add_column :comments, :article_slug, :string
  end
end
