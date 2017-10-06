require 'pry-byebug'
require_relative '../models/customers'
require_relative '../models/films'
require_relative '../models/screenings'
require_relative '../models/tickets'

Screening.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new( {'name'=>'Chad', 'funds'=>100, 'age'=>25, 'student_status'=>true, 'items_brought'=>[]} )
customer1.save()

customer2 = Customer.new( {'name'=>'Michael', 'funds'=>120, 'age'=>26, 'student_status'=>true, 'items_brought'=>[]} )
customer2.save()

################################################

film1 = Film.new( {'title'=>'Bladerunner', 'price'=>10, 'age_rating'=>15, 'duration'=>125} )
film1.save()

film2 = Film.new( {'title'=>'Dark Knight Rises', 'price'=>9, 'age_rating'=>12, 'duration'=>155} )
film2.save()

################################################

screening1 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'00:00', 'day'=>'Monday'} )
screening1.save()

screening2 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'3:00', 'day'=>'Monday'} )
screening2.save()

################################################

ticket1 = Ticket.new( {'customer_id'=>customer1.id(), 'screening_id'=>screening1.id()} )
ticket1.save()

ticket2 = Ticket.new( {'customer_id'=>customer2.id(), 'screening_id'=>screening1.id()} )
ticket2.save()

ticket3 = Ticket.new( {'customer_id'=>customer1.id(), 'screening_id'=>screening2.id()} )
ticket3.save()

ticket4 = Ticket.new( {'customer_id'=>customer2.id(), 'screening_id'=>screening2.id()} )
ticket4.save()

binding.pry
nil
