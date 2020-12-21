# frozen_string_literal: true

class UserGroup < ApplicationRecord
  has_many :users, dependent: :destroy
end
