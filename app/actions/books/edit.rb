# frozen_string_literal: true
module Bookshelf
  module Actions
    module Books
      class Edit < Bookshelf::Action
        include Deps["repos.book_repo"]

        def handle(request, response)
          book = book_repo.get(request.params[:id])

          response.render view,
            book: book,
            categories: book_repo.class::Categories.values,
            formats: book_repo.class::Formats.values
        end
      end
    end
  end
end
