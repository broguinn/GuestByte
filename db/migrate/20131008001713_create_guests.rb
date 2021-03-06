class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name
      t.string :affiliation
      t.string :email
      t.belongs_to :event

      t.timestamps
    end
  end
end
