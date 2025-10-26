# frozen_string_literal: true

module Bookshelf
  module Views
    module Books
      class Index < Bookshelf::View
        expose :books do
          [
            {title: "Test Driven Development"},
            {title: "Practical Object-Oriented Design in Ruby"}
          ]
        end
      end
    end
  end
end
