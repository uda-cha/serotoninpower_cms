class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :post_id
      t.string :name
      t.boolean :public
      t.text :content

      t.timestamps
    end
  end
end
