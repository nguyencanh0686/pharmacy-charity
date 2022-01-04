class CreateNationals < ActiveRecord::Migration[6.0]
  def change
    create_table :nationals, id: :bigint do |t|
      t.string   :name

      t.datetime    :deleted_at, index: true
      t.timestamps
    end
  end
end
