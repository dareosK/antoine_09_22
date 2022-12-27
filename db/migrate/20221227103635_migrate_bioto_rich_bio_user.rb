class MigrateBiotoRichBioUser < ActiveRecord::Migration[7.0]
  def up
    User.find_each do |user|
      user.update(rich_bio: user.bio)
    end
  end

  def down
    User.find_each do |user|
      user.update(bio: user.rich_bio)
      user.update(rich_bio: nil)
    end
  end
end
