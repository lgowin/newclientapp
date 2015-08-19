class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :dateservice
      t.decimal :copayowed
      t.decimal :copayd
      t.date :claimsubmit
      t.date :claimrecvd
      t.decimal :claimowed
      t.decimal :claimpd
      t.integer :cptcode
      t.text :sessionnotes
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
