class CreatePostsubs < ActiveRecord::Migration
  def change
    create_table :postsubs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.timestamps null: false
    end

    change_table :posts do |t|
      t.remove :sub_id
    end
  end
end
