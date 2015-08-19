class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :homephone
      t.string :cellphone
      t.string :email
      t.string :referral
      t.string :insurance
      t.decimal :inspay
      t.decimal :copay
      t.text :clientnotes
      t.binary :active

      t.timestamps null: false
    end
  end
end
