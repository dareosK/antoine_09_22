class MigrateTexttoRichBodyArticles < ActiveRecord::Migration[7.0]
  def up
    Project.find_each do |project|
      project.update(rich_body: project.text)
    end
  end

  def down
    Project.find_each do |project|
      project.update(body: project.rich_body)
      project.update(rich_body: nil)
    end
  end
end
