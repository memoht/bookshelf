module Bookshelf
  module Views
    module Books
      class Show < Bookshelf::View
        expose :book
        expose :barcode
        expose :categories
        expose :formats
      end
    end
  end
end
