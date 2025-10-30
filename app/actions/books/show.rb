# app/actions/books/show.rb
require "rom"

module Bookshelf
  module Actions
    module Books
      class Show < Bookshelf::Action
        include Deps["repos.book_repo"]

        def handle(request, response)
          book = book_repo.get(request.params[:id])

          barcode_svg = generate_barcode(book.isbn) if book.isbn

          response.render(
            view,
            book: book,
            barcode: barcode_svg,
            categories: book_repo.class::Categories.values,
            formats: book_repo.class::Formats.values
          )
        end

        private

        def generate_barcode(isbn)
          require "barby"
          require "barby/barcode/bookland"
          require "barby/outputter/svg_outputter"

          digits = isbn.to_s.gsub(/[^0-9xX]/, '')
          return nil if digits.empty?

          barcode = Barby::Bookland.new(digits)
          Barby::SvgOutputter.new(barcode).to_svg(margin: 10, height: 50)
        rescue ArgumentError
          nil
        end
      end
    end
  end
end
