# frozen_string_literal: true

module Bookshelf
  module Actions
    module Books
      class New < Bookshelf::Action
        include Deps["repos.book_repo"]

        def handle(request, response)
            response.render view,
              categories: book_repo.categories,
              formats: book_repo.formats
        end
      end
    end
  end
end
