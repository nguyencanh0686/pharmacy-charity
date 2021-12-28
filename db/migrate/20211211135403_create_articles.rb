class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles, id: :uuid do |t|
      t.references  :article_group
      t.string      :title
      t.string      :hash_tags, array: true
      t.text        :body
      t.references  :individual,  type: :uuid

      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
