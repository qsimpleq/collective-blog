# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# require 'active_record/fixtures'
#
# seeds_path = Rails.root.join('db/seeds')
# fixtures = %w[
#   categories
#   users
#   posts
#   post_likes
#   post_comments
# ]
# ActiveRecord::Base.transaction do
#   fixtures.each { ActiveRecord::FixtureSet.create_fixtures(seeds_path, _1) }
#   PostLike.all.group(:post_id).pluck(:post_id).each { Post.reset_counters(_1, :likes) }
# end

require 'faker'

require_relative 'seeds/users'
require_relative 'seeds/categories'
require_relative 'seeds/posts'
require_relative 'seeds/post_comments'
require_relative 'seeds/post_likes'

Rails.logger.debug 'ok'
