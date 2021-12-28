class CreateClinics < ActiveRecord::Migration[6.0]
  def change
    create_table :clinics, id: :uuid do |t|
      t.string   :name
      t.string   :address
      t.references  :city
      t.references  :district
      t.text        :description

      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
