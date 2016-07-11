class Job < ActiveRecord::Base
	belongs_to :category
	# sort the jobs in most recent on top.
	scope :sorted, lambda{ order("created_at DESC")}
end
