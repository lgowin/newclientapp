class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :expensedate
      t.string :vendor
      t.string :expensedesc
      t.decimal :expense

      t.timestamps null: false
    end
  end
end
