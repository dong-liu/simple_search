class CreateTickets < ActiveRecord::Migration[5.0]
  def up
    create_table :tickets, :id => false do |t|
    	t.string "_id", :null => false
    	t.string "url"
	    t.string "external_id"
	    t.string "created_at", null: false, default: Time.now
	    t.string "type"
	    t.string "subject"
	    t.text "description"
	    t.string "priority"
	    t.string "status"
	    t.string "submitter_id"
	    t.string "assignee_id"
	    t.integer "organization_id"
	    t.string "tags"
	    t.boolean "has_incidents"
	    t.string "due_at", default: Time.now
	    t.string "via"
	    
      t.datetime "updated_at"
    end
    add_index("tickets", "_id", unique: true)		#primary key
    add_index("tickets", "organization_id")			#foreign key
    add_index("tickets", "submitter_id")
    add_index("tickets", "assignee_id")
  end

  def down
  	remove_index("tickets", "organization_id")
  	remove_index("tickets", "_id")
  	drop_table :tickets
  end

end
