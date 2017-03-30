class CreateEwallets < ActiveRecord::Migration[5.0]
  def change
    create_table :ewallets do |t|
      t.references :user, foreign_key: true
      t.string :currency
      t.string :description
      t.string :choice
      t.integer :balance, default: 0

      t.timestamps
    end
  end
end
