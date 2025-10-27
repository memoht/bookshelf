# app/actions/books/show.rb
require "rom"

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps["repos.book_repo"]
        def handle(request, response)
          response.render(
            view, id: request.params[:id],
            categories: book_repo.class::Categories.values,
            formats: book_repo.class::Formats.values
            )
        end
      end
    end
  end
end
