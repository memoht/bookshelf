# frozen_string_literal: true

module Bookshelf
  module Repos
    class BookRepo < Bookshelf::DB::Repo

      # Enums
      Categories = Types::Strict::String.default('fiction').enum('fiction', 'nonfiction', 'reference').freeze
      Formats = Types::Strict::String.default('paperback').enum('hardcover', 'paperback', 'ebook', 'audiobook').freeze

      def get(id)
        books.by_pk(id).one!
      end

      def create(attributes)
        books.changeset(:create, attributes).commit
      end

      def update(id, attributes)
        books.by_pk(id).update(attributes)
        get(id)
      end

      def all_by_title(page:, per_page:)
        books
          .order(books[:title].asc)
          .page(page)
          .per_page(per_page)
          .to_a
      end
    end
  end
end
