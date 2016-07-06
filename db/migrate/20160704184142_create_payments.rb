class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.text :payment_method
      t.text :bank
      t.text :credit_card_number
      t.integer :credit_card_key

      t.timestamps null: false
    end
  end
end
