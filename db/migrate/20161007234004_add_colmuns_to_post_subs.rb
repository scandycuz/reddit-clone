class AddColmunsToPostSubs < ActiveRecord::Migration
  def change
    change_table :postsubs do |t|
      t.column :post_id, :integer, null: false, default: 0
      t.column :sub_id, :integer, null: false, default: 0
    end

    change_table :posts do |t|
      t.remove :sub_id
    end
  end
end
