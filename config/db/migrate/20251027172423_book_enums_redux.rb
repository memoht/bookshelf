# frozen_string_literal: true

ROM::SQL.migration do
  up do
    alter_table :books do
      drop_column :category
      drop_column :format
    end

    drop_enum :book_categories
    drop_enum :book_formats
  end

  down do
    create_enum :book_categories, %w[fiction nonfiction reference]
    create_enum :book_formats, %w[hardcover paperback ebook audiobook]

    alter_table :books do
      add_column :category, :book_categories, default: "fiction", null: false
      add_column :format, :book_formats, default: "paperback", null: false
    end
  end
end
