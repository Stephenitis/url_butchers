class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :originalurl
      t.string :shorturl
      t.integer :counter, :default => 0
      t.references :user
    end
  end
end
