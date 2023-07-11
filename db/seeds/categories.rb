# frozen_string_literal: true

def create_categories
  return if Category.any?

  %w[
    one
    two
    three
    books
    javascript
    perl
    ruby
    vacations
  ].each { |name| Category.create!(name:) }
end

create_categories
