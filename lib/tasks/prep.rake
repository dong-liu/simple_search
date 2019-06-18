require 'json'
require 'activerecord-import'

namespace :prep do
  desc "Preparation: import organizations data from tmp/organizations.json"
  task import_existing_organization_data: :environment do
  	org_filename = Rails.root.join('tmp', 'organizations.json')
  	# orgs contains the array of all the organizations
  	orgs =  JSON.parse(File.read(org_filename))
  	# need to make sure all the values for each key is present, otherwise import will fail.
  	orgs.each do |org|
  		org.transform_values! {|v| v.nil? ? "" : v }
  	end
		# now import
		org_instances = []
		orgs.each do |org|
  		org_instances << Organization.new(org)
  	end
		Organization.import org_instances
  end

  desc "Preparation: import tickets data from tmp/tickets.json"
  task import_existing_ticket_data: :environment do
  	ticket_filename = Rails.root.join('tmp', 'tickets.json')
  	# tickets contains the array of all the tickets from the given data file
  	tickets =  JSON.parse(File.read(ticket_filename))
  	# need to make sure all the values for each key is present, otherwise import will fail.
  	tickets.each do |ticket|
  		ticket.transform_values! {|v| v.nil? ? "" : v }
  	end
		# now import
		ticket_data = []
		tickets.each do |ticket|
  		ticket_data << Ticket.new(ticket)
  	end
		Ticket.import ticket_data
  end

  desc "Preparation: import users data from tmp/users.json"
  task import_existing_user_data: :environment do
  	user_filename = Rails.root.join('tmp', 'users.json')
  	# users contains the array of all the users from the given users.json
  	users =  JSON.parse(File.read(user_filename))
  	# need to make sure all the values for each key is present, otherwise import will fail.
  	users.each do |user|
  		user.transform_values! {|v| v.nil? ? "" : v }
  	end
		# now import
		user_data = []
		users.each do |user|
  		user_data << User.new(user)
  	end
		User.import user_data
  end

end
