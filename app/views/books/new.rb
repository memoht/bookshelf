# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class New < Bookshelf::View
        expose :categories
        expose :formats
      end
    end
  end
end
