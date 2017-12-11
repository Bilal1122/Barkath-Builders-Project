class CreateFeaturedProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :featured_projects do |t|
      t.string :title
      t.text :description
      t.string :client_name
      t.datetime :project_start
      t.datetime :project_end

      t.timestamps
    end
  end
end
