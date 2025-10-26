# spec/features/books/index_spec.rb

RSpec.feature "Books index" do
  let(:books) { Hanami.app["relations.books"] }

  before do
    books.insert(title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz", isbn: "978-0134456478", category: "nonfiction", format: "paperback")
    books.insert(title: "Test Driven Development", author: "Kent Beck", isbn: "978-0321146533", category: "nonfiction", format: "paperback")
  end

  it "shows a list of books" do
    visit "/books"

    expect(page).to have_selector "h5", text: "Test Driven Development"
    expect(page).to have_selector "h5", text: "Practical Object-Oriented Design in Ruby"
  end
end
