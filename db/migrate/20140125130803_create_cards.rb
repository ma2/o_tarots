class CreateCards < ActiveRecord::Migration
	def change
		create_table :cards do |t|
			t.integer :number
			t.string :name
			t.string :text
			t.string :description
			t.references :tarot

			t.timestamps
		end
	end
end
