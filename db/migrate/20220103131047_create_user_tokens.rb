class CreateUserTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tokens, id: :uuid do |t|
      t.references  :user, type: :uuid
      t.string      :device_ip, index: true
      t.datetime    :expired_at, index: true
      t.timestamps
    end

    add_index :user_tokens, :created_at
  end
end
