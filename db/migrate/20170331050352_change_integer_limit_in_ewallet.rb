class ChangeIntegerLimitInEwallet < ActiveRecord::Migration[5.0]
  def change
  	change_column :ewallets, :balance, :integer, limit: 8
  end
end
