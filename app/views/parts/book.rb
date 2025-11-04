# app/views/parts/book.rb
# auto_register: false
module Bookshelf
  module Views
    module Parts
      class Book < Bookshelf::Views::Part
        include Hanami::View::Helpers::EscapeHelper

        def show_path
          context.routes.path(:book, id: id)
        end

        def edit_path
          context.routes.path(:edit_book, id: id)
        end

        def open_library_cover_url
          return nil unless isbn
          "https://covers.openlibrary.org/b/isbn/#{isbn}.jpg"
        end

        def formatted_isbn
          return nil unless isbn

          digits = isbn.to_s.gsub(/[^0-9xX]/, '')

          case digits.length
          when 10
            "#{digits[0]}-#{digits[1..6]}-#{digits[7..8]}-#{digits[9]}"
          when 13
            "#{digits[0..2]}-#{digits[3]}-#{digits[4..8]}-#{digits[9..11]}-#{digits[12]}"
          else
            isbn
          end
        end
      end
    end
  end
end
