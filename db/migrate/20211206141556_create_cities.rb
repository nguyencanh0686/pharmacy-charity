class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities, id: :bigint do |t|
      t.string      :name
      t.references  :national
      t.datetime    :deleted_at

      t.timestamps
    end
  end
end
