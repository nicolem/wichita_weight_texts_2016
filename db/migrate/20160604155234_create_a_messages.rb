class CreateAMessages < ActiveRecord::Migration
  def change
    create_table :a_messages do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
