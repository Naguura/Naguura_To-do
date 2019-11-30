class List < ApplicationRecord
	validates :task, presence: true
	
	validates :status, inclusion: { in: [ true, false ] }
end
