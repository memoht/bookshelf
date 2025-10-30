# app/actions/books/create.rb

module Bookshelf
  module Actions
    module Books
      class Create < Bookshelf::Action
        include Deps["repos.book_repo", "views.books.new"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
            required(:category).filled(:string)
            required(:format).filled(:string)
            required(:publication_date).filled(:date)
            optional(:isbn).maybe(:string, format?: /\A\d{10}(\d{3})?\z/)
          end
        end

        def handle(request, response)
          if request.params.valid?
            book = book_repo.create(request.params[:book])

            response.flash[:notice] = "Book created"
            response.redirect_to routes.path(:show_book, id: book[:id])
          else
            response.flash.now[:alert] = "Could not create book"
            # Implicitly re-renders the "new" view
            response.render new,
              categories: book_repo.class::Categories.values,
              formats: book_repo.class::Formats.values
          end
        end
      end
    end
  end
end
