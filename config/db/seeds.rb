# This seeds file should create the database records required to run the app.
#
# The code should be idempotent so that it can be executed at any time.
#
# To load the seeds, run `hanami db seed`. Seeds are also loaded as part of `hanami db prepare`.

# For example, if you have appropriate repos available:
#
#   category_repo = Hanami.app["repos.category_repo"]
#   category_repo.create(title: "General")
#
# Alternatively, you can use relations directly:
#
#   categories = Hanami.app["relations.categories"]
#   categories.insert(title: "General")

book_repo = Hanami.app["repos.book_repo"]
book_repo.create(title: "Practical Object-Oriented Design", author: "Sandi Metz", isbn: "9780134456478", category: "reference", format: "paperback", publication_date: Date.new(2018, 8, 22))
book_repo.create(title: "Test Driven Development", author: "Kent Beck", isbn: "9780321146533", category: "reference", format: "paperback", publication_date: Date.new(2002, 11, 8))
book_repo.create(title: "Rails 3 in Action", author: "Ryan Bigg", isbn: "9781935182276", category: "reference", format: "paperback", publication_date: Date.new(2011, 1, 01))
