class CreateArticleGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :article_groups do |t|
      t.string :name
      t.boolean   :blocked

      t.datetime    :deleted_at, index: true
      t.timestamps
    end
  end
end
