class Ticket < ApplicationRecord

  # disable STI
  self.inheritance_column = :_type_disabled

	self.primary_key = :_id

	belongs_to :organization
	belongs_to :users

  scope :shared_tickets, -> { where(:shared_tickets => true) }
  scope :incident_tickets, -> { where(:has_incidents => true) }
  scope :not_incident_tickets, -> { where(:has_incidents => false) }

  scope :sorted, -> { order("_id ASC") }
  scope :sorted_by_type, -> { order("type ASC") }
  scope :sorted_by_priority, -> { order("priority ASC") }
  scope :sorted_by_status, -> { order("status ASC") }
  scope :sorted_by_origin, -> { order("via ASC") }
  scope :newest_first, -> { order("created_at DESC") }
  scope :due_at, -> { order("due_at DESC") }

  scope :search_by_submitter_id, -> (id) { where(:submitter_id => id) }

end
