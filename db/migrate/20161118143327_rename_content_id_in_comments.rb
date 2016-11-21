class RenameContentIdInComments < ActiveRecord::Migration[5.0]
  def change
    change_table :comments do |t|
      t.rename :content_id, :link_id
    end
  end
end
