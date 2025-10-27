# frozen_string_literal: true

ROM::SQL.migration do
  # Add your migration here.
  #
  # See https://guides.hanamirb.org/v2.2/database/migrations/ for details.
  change do
    alter_table :books do
      add_column :category, String, default: "fiction", null: false
      add_column :format, String, default: "paperback", null: false
    end
  end
end
