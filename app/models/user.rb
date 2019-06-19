class User < ApplicationRecord

	self.primary_key = :_id
	 
	belongs_to :organization
	has_many :tickets

	scope :active, -> { where(:active => true) }
	scope :inactive, -> { where(:visible => false) }
	scope :verified, -> { where(:verified => true) }
	scope :unverified, -> { where(:verified => false) }
	scope :shared, -> { where(:shared => true) }
	scope :notshared, -> { where(:shared => false) }
	scope :suspended, -> { where(:suspended => true) }
	scope :reinstated, -> { where(:suspended => false) }

  scope :sorted, -> { order("_id ASC") }
  scope :sorted_by_role, -> { order("role ASC") }
  scope :newest_first, -> { order("created_at DESC") }
  
  #scope :search, -> {|query| where(["name LIKE ?", "%#{query}%"]) }

end
