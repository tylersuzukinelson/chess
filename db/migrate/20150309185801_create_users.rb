class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :uid
      t.string :twitter_consumer_token
      t.string :twitter_consumer_secret
      t.text :omniauth_raw_data

      t.timestamps null: false
    end
  end
end
