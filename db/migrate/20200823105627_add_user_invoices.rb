class AddUserInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :user_id, :int, :after => "id"
  end
end
