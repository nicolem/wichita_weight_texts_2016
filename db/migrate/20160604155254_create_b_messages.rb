class CreateBMessages < ActiveRecord::Migration
  def change
    create_table :b_messages do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
