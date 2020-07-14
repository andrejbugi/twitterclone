class RemoveAuthorFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :author
  end
end
