class AddAnalysisToMessages < ActiveRecord::Migration[7.2]
  def change
    add_column :messages, :analysis, :jsonb
  end
end
