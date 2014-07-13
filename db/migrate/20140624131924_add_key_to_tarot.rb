class AddKeyToTarot < ActiveRecord::Migration
  def change
    add_column :tarots, :key, :string
  end
end
