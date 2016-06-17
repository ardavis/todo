class AddConversionToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :conversion, :string
  end
end
