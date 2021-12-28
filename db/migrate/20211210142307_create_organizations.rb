class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations, id: :uuid do |t|
      t.string   :name
      t.string   :phone_number
      t.string   :address
      t.references  :city
      t.references  :district

      t.datetime    :deleted_at
      t.timestamps
    end
  end
end
