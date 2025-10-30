# frozen_string_literal: true

ROM::SQL.migration do
  change do
    add_column :books, :publication_date, Date
  end
end
