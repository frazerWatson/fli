class AddAttachmentPanoramicImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :panoramic_image
    end
  end

  def self.down
    remove_attachment :posts, :panoramic_image
  end
end
