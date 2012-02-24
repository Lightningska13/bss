class Event < ActiveRecord::Base
  #has_and_belongs_to_many :services
  
  def	self.find_for_home(event_type,order)
   	if event_type
   		this_condition = " AND event_type='#{event_type}'"
   		unless event_type == 'Event' #for News and Bulletins
   			this_condition= "AND start_date<='#{Date.today}' " + this_condition
   		end
   	end
   	#find(:all, :limit=>6, :order=>'start_date '+ order, :conditions=>"end_date >= '#{Date.today}' #{this_condition}" )
   	where("end_date >= '#{Date.today}' #{this_condition}").order('start_date '+ order).limit(6)
   end
end
