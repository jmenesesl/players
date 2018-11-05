class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.column :name, :string, :limit => 32, :null => false
      t.column :category, :text
      t.column :country, :text
      t.column :created_at, :timestamp
    end
  end
end
