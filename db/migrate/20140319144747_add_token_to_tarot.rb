class AddTokenToTarot < ActiveRecord::Migration
  def change
    add_column :tarots, :token, :string
  end
end
