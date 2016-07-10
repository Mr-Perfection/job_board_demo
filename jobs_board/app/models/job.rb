class Job < ActiveRecord::Base
	# sort the jobs in most recent on top.
	scope :sorted, lambda{ order("created_at DESC")}
end
