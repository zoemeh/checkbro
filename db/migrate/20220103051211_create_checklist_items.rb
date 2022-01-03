class CreateChecklistItems < ActiveRecord::Migration[7.0]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, null: false, foreign_key: true
      t.text :description
      t.boolean :is_done

      t.timestamps
    end
  end
end
