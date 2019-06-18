class CreateOrganizations < ActiveRecord::Migration[5.0]
  def up
    create_table :organizations, :primary_key => '_id' do |t|
	    t.string "url"
	    t.string "external_id"
	    t.string "name"
	    t.string "domain_names"
      t.string "created_at", null: false, default: Time.now
	    t.string "details"
	    t.boolean "shared_tickets"
	    t.string "tags"

      t.datetime "updated_at"
    end   
    #execute "ALTER TABLE organizations AUTO_INCREMENT = 101;"
  end

  def down
  	drop_table :organizations
  end

end
