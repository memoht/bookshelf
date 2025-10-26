module Bookshelf
  module Views
    module Books
      class Update < Bookshelf::View
        expose :book
        expose :categories
        expose :formats
      end
    end
  end
end
