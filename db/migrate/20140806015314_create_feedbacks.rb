class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :project_id
      t.text :content
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
