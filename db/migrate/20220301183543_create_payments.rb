class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :user
      t.string :invoice_fiscal_id

      t.string :sender_clabe
      t.string :receiver_clabe

      t.integer :amount_cents
      t.string :amount_currency

      t.datetime :sent_at

      t.timestamps

      t.index :sender_clabe
      t.index :receiver_clabe
    end
  end
end
