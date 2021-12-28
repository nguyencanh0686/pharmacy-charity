class CreateUserRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_roles, id: :uuid do |t|
      t.references   :user, type: :uuid
      t.string       :role_name
      t.jsonb        :scopes
      t.datetime     :expired, index: true

      t.datetime     :deleted_at, index: true
      t.timestamps
    end
  end
end
