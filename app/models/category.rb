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
#  unique_name  (name) UNIQUE
#
class Category < ApplicationRecord
  has_many :posts

  validates :name, uniqueness: true
end
