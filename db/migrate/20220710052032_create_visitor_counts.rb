class CreateVisitorCounts < ActiveRecord::Migration[6.1]
  def change
    create_table :visitor_counts, id: :uuid do |t|
      t.boolean :is_active, :default => true
      t.boolean :is_disabled, :default => false
      t.integer :count, :default => 0

      t.timestamps
    end
  end
end
