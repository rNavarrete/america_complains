class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string   :name
      t.decimal :lon, :precision  =>10, :scale => 6
      t.decimal :lng, :precision => 10, :scale => 6
      t.string  :address

      t.timestamps
    end
  end
end
