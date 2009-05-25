class CreateSolutionTypes < ActiveRecord::Migration
  def self.up
    create_table :solution_types do |t|
      t.string :st_name #st_name与service_type的字段相同，请注意

      t.timestamps
    end
  end

  def self.down
    drop_table :solution_types
  end
end
