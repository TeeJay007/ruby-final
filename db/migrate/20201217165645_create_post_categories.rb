# frozen_string_literal: true

# Create post categories
class CreatePostCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :post_categories do |t|
      t.string :name
    end
  end
end
