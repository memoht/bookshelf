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

      end
    end
  end
end
