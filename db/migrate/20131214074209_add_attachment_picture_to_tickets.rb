class AddAttachmentPictureToTickets < ActiveRecord::Migration
  def self.up
    change_table :tickets do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :tickets, :picture
  end
end
