# frozen_string_literal: true

ROM::SQL.migration do
  up do
    extension :pg_enum
    execute 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'

    create_enum :book_categories, %w[fiction nonfiction reference]
    create_enum :book_formats, %w[hardcover paperback ebook audiobook]

    create_table :books do
      primary_key :id, 'uuid', default: Sequel.lit('uuid_generate_v4()')
      column :title, :text, null: false
      column :author, :text, null: false
      column :category, :book_categories, default: "fiction", null: false
      column :format, :book_formats, default: "paperback", null: false
      column :isbn, :text
    end
  end

  down do
    drop_table :books
    drop_enum :book_categories
    drop_enum :book_formats
    run 'DROP EXTENSION IF EXISTS "uuid-ossp"'
  end
end
