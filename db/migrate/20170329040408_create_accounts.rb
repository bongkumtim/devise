class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.decimal :ringgitcoin, precision: 14, scale: 2, default: 0.00
      t.decimal :bahtcoin, precision: 14, scale: 2, default: 0.00
      t.decimal :rupiahcoin, precision: 14, scale: 2, default: 0.00
      t.decimal :singcoin, precision: 14, scale: 2, default: 0.00

      t.timestamps
    end
  end
end
