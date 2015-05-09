class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
