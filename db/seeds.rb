# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'active_record/fixtures'

seeds_path = Rails.root.join('db/seeds')
fixtures = %w[
  categories
  users
  posts
  post_likes
  post_comments
]
ActiveRecord::Base.transaction do
  fixtures.each { ActiveRecord::FixtureSet.create_fixtures(seeds_path, _1) }
end
