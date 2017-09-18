class ChangeYearColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :films do |t|
      t.change :year, :integer
    end
  end
end
