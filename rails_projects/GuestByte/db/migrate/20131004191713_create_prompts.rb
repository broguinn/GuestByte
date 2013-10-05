class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.string :content
      t.belongs_to :event

      t.timestamps
    end
  end
end
