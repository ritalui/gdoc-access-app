class CreateProviderAuths < ActiveRecord::Migration
  def change
    create_table :provider_auths do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :refresh_token

      t.timestamps
    end
  end
end
