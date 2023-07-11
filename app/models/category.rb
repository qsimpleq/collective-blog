# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name)
#
class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  VALIDATORS = { name: { presence: true, uniqueness: true, length: { minimum: 1, maximum: 50 } } }.freeze

  validates :name, VALIDATORS[:name]
end
