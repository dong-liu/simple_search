class User < ApplicationRecord

	self.primary_key = :_id
	 
	belongs_to :organization
	has_and_belongs_to_many :tickets

	scope :active, lambda { where(:active => true) }
	scope :inactive, lambda { where(:visible => false) }
	scope :verified, lambda { where(:verified => true) }
	scope :unverified, lambda { where(:verified => false) }
	scope :shared, lambda { where(:shared => true) }
	scope :notshared, lambda { where(:shared => false) }
	scope :suspended, lambda { where(:suspended => true) }
	scope :reinstated, lambda { where(:suspended => false) }

  scope :sorted, lambda { order("_id ASC") }
  scope :sorted_by_role, lambda { order("role ASC") }
  scope :newest_first, lambda { order("created_at DESC") }
  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"]) }

end
