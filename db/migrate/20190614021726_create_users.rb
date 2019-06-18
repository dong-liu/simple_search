class CreateUsers < ActiveRecord::Migration[5.0]
  def up
    create_table :users, :primary_key => '_id' do |t|
    	t.string "url"
    	t.string "external_id"
    	t.string "name"
    	t.string "alias"
        t.string "created_at", null: false, default: Time.now
    	t.boolean "active"
    	t.boolean "verified"
    	t.boolean "shared"
    	t.string "locale"
    	t.string "timezone"
    	t.datetime "last_login_at"
    	t.string "email", :default => ''
    	t.string "phone"
    	t.string "signature", :default => "Don't Worry Be Happy!"
    	t.integer "organization_id"
    	t.string "tags"
    	t.boolean "suspended"
    	t.string "role"

        t.datetime "updated_at"
    end
    add_index("users", "organization_id")       #foreign key
  end

  def down
    remove_index("users", "organization_id")
    drop_table :users
  end
end
