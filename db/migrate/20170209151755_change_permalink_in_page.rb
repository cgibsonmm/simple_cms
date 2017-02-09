class ChangePermalinkInPage < ActiveRecord::Migration[5.0]
  def change
    change_column :pages, :permalink, :string
  end
end
