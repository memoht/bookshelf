# app/actions/books/show.rb
require "rom"

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps[
          "repos.book_repo",
          generate_barcode: "operations.books.generate_barcode"]

        def handle(request, response)
          book = book_repo.get(request.params[:id])

          barcode_svg = generate_barcode.call(book.isbn) if book.isbn

          response.render(
            view,
            book: book,
            barcode: barcode_svg,
            categories: book_repo.class::Categories.values,
            formats: book_repo.class::Formats.values
          )
        end
      end
    end
  end
end
