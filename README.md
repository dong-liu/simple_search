# README

Using the provided data (tickets.json and users.json and organization.json) write a simple command line application (or a locally runnable web-app) to search the data and return the results in a human readable format.

Software verrsion
 - Ruby 2.6.3p62
 - Rails 5.0.7.2
 - MySQL 8.0.16
 
Setup
* Run 'bundle install' from the command line
* Aside from normal gems that one gets after installation of Rails, I used 2 other gems ('json' and 'activerecord-import') for data importing.

Database creation
* Run the db:migrate to create the database tables in the following order: Organization first, then Ticket, User last.

Data population
* Run the following tasks to prepopulate the data
  - rake prep:import_existing_organization_data
  - rake prep:import_existing_user_data
  - rake prep:import_existing_ticket_data
  - For importing the JSON data, I made an assumption that wouldn't be done very frequent. Therefore, I made it an one-off task. If later, that needs to be done again at a regular basis, a scheduled job can be created to achieve that.

Run
* Just bring up your rails server, and type in the URL http://localhost:3000/search.
* All the search menus are exactly coded as shown in the doc.

Note:
- When import existing ticket data, ran into the following error:
ActiveRecord::SubclassNotFound: The single-table inheritance mechanism failed to locate the subclass: 'incident'. This error is raised because the column 'type' is reserved for storing the class in case of inheritance. Please rename this column if you didn't intend it to be used for storing the inheritance class or overwrite Ticket.inheritance_column to use another column for that information.
Based on what I read (https://stackoverflow.com/questions/17879024/activerecordsubclassnotfound-the-single-table-inheritance-mechanism-failed-to). I added the following into the Ticket model, to disable STI. For the purpose of this exercise, this should be ok.
    self.inheritance_column = :_type_disabled


- created_at, MySQL doesn't use the ISO8601 format for timestamps for "created_at" field which is what has been used in the data file.
MySQL uses ISO9075 format, "2019-06-17 18:08:59"
Workaround: change the data type for "created_at" to be String, so that when initial data import will preserve the original format, and set the default to Time.now for the new records submitted later. 

- Some additional features 
  * To see the list of all the organizations: http://localhost:3000/organizations
  * To see the list of all the users: http://localhost:3000/users
  * To see the list of all the tickets: http://localhost:3000/tickets
  I didn't have enough time to add more css style to the views.

- Known issues
  * Right now, all the searches only return the first result. 

* ...
# simple_search
