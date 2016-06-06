class CreateCMessages < ActiveRecord::Migration
  def change
    create_table :c_messages do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
