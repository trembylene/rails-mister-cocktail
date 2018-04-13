class AddSummaryToCocktails < ActiveRecord::Migration[5.1]
  def change
    add_column :cocktails, :summary, :text
  end
end
