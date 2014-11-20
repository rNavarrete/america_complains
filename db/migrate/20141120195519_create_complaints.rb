class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :product
      t.string :sub_product
      t.string :issue
      t.string :sub_issue
      t.string :state
      t.integer :zipcode
      t.string :date_submitted
      t.string :company
      t.string :consumer_disputed

      t.timestamps
    end
  end
end
