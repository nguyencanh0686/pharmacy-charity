class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines, id: :uuid do |t|
      t.string      :name
      t.text        :uses
      t.text        :contraindications
      t.text        :side_effectes
      t.string      :sort_name, index: true
      t.jsonb       :ingredients
      t.uuid        :created_by, index: true

      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
