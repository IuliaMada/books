class Book < ActiveRecord::Base
	validates :title, presence: true
	validates :title, length: { maximum: 500 }
	validate :published_date_should_not_be_in_the_future

	def published_date_should_not_be_in_the_future
	   	errors.add(:published, "is required and can't be in the future") if
	    published.blank? or published > Date.today
	end 

end
