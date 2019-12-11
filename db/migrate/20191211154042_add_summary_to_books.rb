class AddSummaryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :book_summary, :string
  end
end
