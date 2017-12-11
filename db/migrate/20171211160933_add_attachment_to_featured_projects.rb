class AddAttachmentToFeaturedProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :featured_projects, :attachment, :string
  end
end
