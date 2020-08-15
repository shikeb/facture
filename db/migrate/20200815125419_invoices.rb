class Invoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :company_name
      t.string :merchant_name
      t.string :merchant_email
      t.string :merchant_phone
      t.string :invoice_number
      t.string :currency
      t.datetime :due_date

      t.string :customer_name
      t.string :customer_email
      t.integer :amount

      t.text :note

      t.timestamps
    end
  end
end
