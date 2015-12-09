class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.string :email, limit: 80
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
