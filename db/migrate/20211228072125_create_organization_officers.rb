class CreateOrganizationOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :organization_officers, id: :uuid do |t|
      t.references   :individual, type: :uuid
      t.references   :organization, type: :uuid
      t.string       :role_name

      t.datetime    :deleted_at, index: true
      t.timestamps
    end
  end
end
