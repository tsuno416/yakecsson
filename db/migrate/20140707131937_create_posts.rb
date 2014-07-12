class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :contributor
      t.text :content
      t.integer :post_number

      t.timestamps
    end
  end
end
