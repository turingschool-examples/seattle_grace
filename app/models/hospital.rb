class Hospital <ApplicationRecord
  validates_presence_of :name
  has_many :doctors


	def doc_count
		doctors.count
	end


	def uniq_universities
		doctors.pluck(:university).uniq
	end
end
