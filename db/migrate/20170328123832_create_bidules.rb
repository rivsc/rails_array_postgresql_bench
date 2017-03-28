class CreateBidules < ActiveRecord::Migration[5.0]
  def change
    create_table :bidules do |t|
      t.integer :liste_gin_ids, array: true, default: []
      t.integer :liste_btree_ids, array: true, default: []
      t.integer :liste_none_ids, array: true, default: []

      t.timestamps
    end

    add_index :bidules, :liste_gin_ids, using: :gin
    add_index :bidules, :liste_btree_ids, using: :btree
  end
end
