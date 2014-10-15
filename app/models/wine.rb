
class Wine < ActiveRecord::Base
	VARIETALS = ['Unknown', 'Merlot', 'Chianti', 'Cabernet Francc']
	validates :name, :year, :winery, :country, :varietal, presence: true
	validates :year,
	   numericality: { only_integer: true, greater_than_or_equal_to: 0 },
	   unless: "year.blank?"
	has_many :logentries, dependent: :destroy
	def format_average_rating
	  if logentries.loaded?
	    logentries.map(&:rating).compact.average
	  else
	    logentries.average(:rating)
	  end
	end				
end
