class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.references :user

      t.string :fiscal_id
      t.string :emitter_rfc
      t.string :receiver_rfc

      t.integer :amount_cents
      t.string :amount_currency

      t.datetime :emitted_at
      t.datetime :expired_at

      t.timestamps

      t.index :fiscal_id, unique: true
      t.index :emitter_rfc
      t.index :receiver_rfc
    end
  end
end
