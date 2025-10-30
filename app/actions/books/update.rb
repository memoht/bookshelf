module Bookshelf
  module Actions
    module Books
      class Update < Bookshelf::Action
        include Deps["repos.book_repo", "views.books.edit"]

        params do
          required(:id).filled(:string)
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
            required(:category).filled(:string)
            required(:format).filled(:string)
            required(:publication_date).filled(:date)
            optional(:isbn).maybe(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            book = book_repo.update(request.params[:id], request.params[:book])

            response.flash[:notice] = "Book updated successfully"
            response.redirect_to routes.path(:show_book, id: book[:id])
          else
            response.flash.now[:alert] = "Could not update book"
            response.render edit,
              book: request.params[:book].merge(id: request.params[:id]),
              categories: book_repo.class::Categories.values,
              formats: book_repo.class::Formats.values
          end
        end
      end
    end
  end
end
