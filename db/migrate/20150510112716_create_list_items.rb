class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.references :task_list, index: true, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
