class CreateIndividuals < ActiveRecord::Migration[6.0]
  def change
    create_table :individuals, id: :uuid do |t|
      t.string   :full_name
      t.string   :phone_number
      t.string   :address
      t.string   :email
      t.datetime :dob
      t.string   :id_number, index: true

      t.references  :city
      t.references  :district

      t.datetime    :deleted_at, index: true
      t.timestamps
    end
  end
end
