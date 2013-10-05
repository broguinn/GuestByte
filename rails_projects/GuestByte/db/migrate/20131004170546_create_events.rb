class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :host
      t.datetime :date

      t.timestamps
    end
  end
end
