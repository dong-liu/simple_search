class Ticket < ApplicationRecord

	self.primary_key = :_id
	
	belongs_to :organization
	has_and_belongs_to_many :users

  scope :shared_tickets, lambda { where(:shared_tickets => true) }
  scope :incident_tickets, lambda { where(:has_incidents => true) }
  scope :not_incident_tickets, lambda { where(:has_incidents => false) }

  scope :sorted, lambda { order("_id ASC") }
  scope :sorted_by_type, lambda { order("type ASC") }
  scope :sorted_by_priority, lambda { order("priority ASC") }
  scope :sorted_by_status, lambda { order("status ASC") }
  scope :sorted_by_origin, lambda { order("via ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :due_at, lambda { order("due_at DESC") }

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

end
