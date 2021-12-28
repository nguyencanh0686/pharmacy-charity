class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients, id: :uuid do |t|
      t.string        :name, index: true
      t.text          :description
      t.text          :uses
      t.text          :contraindications
      t.text          :side_effectes

      t.boolean       :approved
      t.uuid          :created_by, index: true
      t.uuid          :approved_by, index: true
      t.datetime      :deleted_at, index: true
      t.timestamps
    end
  end
end
