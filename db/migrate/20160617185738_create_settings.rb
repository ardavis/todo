class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :name
      t.string :value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
