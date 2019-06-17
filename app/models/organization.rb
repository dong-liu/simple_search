class Organization < ApplicationRecord

	self.primary_key = :_id
	
	has_many :users
	has_many :tickets

  scope :shared_tickets, lambda { where(:shared_tickets => true) }

  scope :sorted, lambda { order("_id ASC") }
  scope :newest_first, lambda { order("created_at DESC") }

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

end
