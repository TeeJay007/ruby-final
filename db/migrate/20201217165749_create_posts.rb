# frozen_string_literal: true

# Create posts
class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :post_category
      t.references :user

      t.timestamps
    end
  end
end
