require 'json'
require 'activerecord-import'

namespace :prep do
  desc "Preparation: import organizations data from tmp/organizations.json"
  task import_organizations: :environment do
    content_of_file = File.read(Rails.root.join('tmp', 'organizations.json'))    
    organizations = JSON.parse(content_of_file)
  	Organization.import organizations
  end

  desc "Preparation: import users data from tmp/users.json"
  task import_users: :environment do
  end

  desc "Preparation: import tickets data from tmp/tickets.json"
  task import_tickets: :environment do
  end

end
