class CreateJoinTableCategoryPurchase < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :purchases do |t|
      t.index %i[category_id purchase_id]
      # t.index [:purchase_id, :category_id]
    end
  end
end
