class AddBusinessIdToComplaints < ActiveRecord::Migration
  def change
    add_reference :complaints, :business, index: true
  end
end
