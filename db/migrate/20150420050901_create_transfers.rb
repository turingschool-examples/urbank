class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.integer :incoming_id, index: true, foreign_key: true
      t.integer :outgoing_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
