# frozen_string_literal: true

# Create user groups
class CreateUserGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :user_groups do |t|
      t.string :name
    end
  end
end
