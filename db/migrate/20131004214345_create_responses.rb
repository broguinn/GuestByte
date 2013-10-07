class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :content
      t.integer :prompt_id

      t.timestamps
    end
  end
end
