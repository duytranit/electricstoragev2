class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.text :content
      t.boolean :status, default: false
      t.integer :feedback_id

      t.timestamps
    end
  end
end
