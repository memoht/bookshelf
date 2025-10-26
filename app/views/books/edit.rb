# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Edit < Bookshelf::View
        include Deps["repos.book_repo"]
        expose :book
        expose :categories
        expose :formats
      end
    end
  end
end
