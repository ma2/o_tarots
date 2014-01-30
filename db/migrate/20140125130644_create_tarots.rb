class CreateTarots < ActiveRecord::Migration
  def change
    create_table :tarots do |t|
      t.string :name
      t.string :author
      t.string :pw

      t.timestamps
    end
  end
end
