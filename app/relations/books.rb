# frozen_string_literal: true

module Bookshelf
  module Relations
    class Books < Bookshelf::DB::Relation
      schema :books, infer: true

      use :pagination
      per_page 5

      def by_author(author)
        books.where(author: author)
      end

      def by_year(year)
        where { Sequel.extract(:year, publication_date) =~ year }
      end
    end
  end
end
