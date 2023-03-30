class ChangeColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :animals, :common_name, :name
    rename_column :animals, :scientific_binomial, :scientific_name
  end
end
