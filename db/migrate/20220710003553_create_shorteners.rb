class CreateShorteners < ActiveRecord::Migration[6.1]
  def change
    create_table :shorteners, id: :uuid do |t|
      t.string :url, :null => false
      t.string :title
      t.string :shortcode, :null => true
      t.datetime :last_accessed
      t.integer :access_count, default: 0
      t.boolean :is_disabled, :default => false
      t.boolean :is_active, :default => true
      t.boolean :is_deleted, :default => false

      t.timestamps
    end
  end
end
