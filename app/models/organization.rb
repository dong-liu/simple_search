class Organization < ApplicationRecord

	self.primary_key = :_id
	
	has_many :users
	has_many :tickets

  scope :shared_tickets, -> { where(:shared_tickets => true) }

  scope :sorted, -> { order("_id ASC") }
  scope :newest_first, -> { order("created_at DESC") }

  scope :search_with_id, -> (id) { where(:id => id) }

end
