class CreateDistricts < ActiveRecord::Migration[6.0]
  def change
    create_table :districts, id: :bigint do |t|
      t.string   :name
      t.references :city

      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
