require 'pry-byebug'
require_relative '../models/customers'
require_relative '../models/films'
require_relative '../models/screenings'
require_relative '../models/tickets'
require_relative '../models/items'

Ticket.delete_all()
Screening.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new( {'name'=>'Chad', 'funds'=>1, 'age'=>25, 'student_status'=>true, 'items_purchased'=>[]} )
customer1.save()

customer2 = Customer.new( {'name'=>'Michael', 'funds'=>120, 'age'=>26, 'student_status'=>true, 'items_purchased'=>[]} )
customer2.save()

customer3 = Customer.new( {'name'=>'Sven', 'funds'=>100, 'age'=>19, 'student_status'=>true, 'items_purchased'=>[]} )
customer3.save()

customer4 = Customer.new( {'name'=>'Elisha', 'funds'=>20, 'age'=>10, 'student_status'=>false, 'items_purchased'=>[]} )
customer4.save()

customer5 = Customer.new( {'name'=>'Eliana', 'funds'=>20, 'age'=>8, 'student_status'=>false, 'items_purchased'=>[]} )
customer5.save()

customer6 = Customer.new( {'name'=>'John', 'funds'=>400, 'age'=>36, 'student_status'=>false, 'items_purchased'=>[]} )
customer6.save()

customer7 = Customer.new( {'name'=>'Ally', 'funds'=>400, 'age'=>35, 'student_status'=>false, 'items_purchased'=>[]} )
customer7.save()

customer8 = Customer.new( {'name'=>'Louise', 'funds'=>120, 'age'=>21, 'student_status'=>true, 'items_purchased'=>[]} )
customer8.save()

customer9 = Customer.new( {'name'=>'Taliyah', 'funds'=>100, 'age'=>31, 'student_status'=>true, 'items_purchased'=>[]} )
customer9.save()

customer10 = Customer.new( {'name'=>'Barney', 'funds'=>80, 'age'=>40, 'student_status'=>false, 'items_purchased'=>[]} )
customer10.save()

################################################

film1 = Film.new( {'title'=>'Bladerunner', 'price'=>10, 'age_rating'=>15, 'duration'=>125} )
film1.save()

film2 = Film.new( {'title'=>'Dark Knight Rises', 'price'=>9, 'age_rating'=>12, 'duration'=>155} )
film2.save()

film3 = Film.new( {'title'=>'Interstellar', 'price'=>10, 'age_rating'=>12, 'duration'=>200})
film3.save()

film4 = Film.new( {'title'=>'Guardians of the Galaxy Vol. 2', 'price'=>12, 'age_rating'=>12, 'duration'=>160})
film4.save()

################################################

screening1 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Monday'} )
screening1.save()

screening2 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Monday'} )
screening2.save()

screening3 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Monday'})
screening3.save()

screening4 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Monday'})
screening4.save()

screening5 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Tuesday'} )
screening5.save()

screening6 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Tuesday'} )
screening6.save()

screening7 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Tuesday'})
screening7.save()

screening8 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Tuesday'})
screening8.save()

screening9 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Wednesday'} )
screening9.save()

screening10 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Wednesday'} )
screening10.save()

screening11 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Wednesday'})
screening11.save()

screening12 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Wednesday'})
screening12.save()

screening13 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Thursday'} )
screening13.save()

screening14 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Thursday'} )
screening14.save()

screening15 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Thursday'})
screening15.save()

screening16 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Thursday'})
screening16.save()

screening17 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Friday'} )
screening17.save()

screening18 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Friday'} )
screening18.save()

screening19 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Friday'})
screening19.save()

screening20 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Friday'})
screening20.save()

screening21 = Screening.new( {'film_id'=>film1.id(), 'seatings'=>30, 'start_time'=>'09:00', 'day'=>'Saturday'} )
screening21.save()

screening22 = Screening.new( {'film_id'=>film2.id(), 'seatings'=>30, 'start_time'=>'12:00', 'day'=>'Saturday'} )
screening22.save()

screening23 = Screening.new( {'film_id'=>film3.id(), 'seatings'=>30, 'start_time'=>'15:30', 'day'=>'Saturday'})
screening23.save()

screening24 = Screening.new( {'film_id'=>film4.id(), 'seatings'=>30, 'start_time'=>'19:50', 'day'=>'Saturday'})
screening24.save()



################################################

ticket1 = Ticket.new( {'customer_id'=>customer1.id(), 'screening_id'=>screening1.id()} )
ticket1.save()

ticket2 = Ticket.new( {'customer_id'=>customer2.id(), 'screening_id'=>screening1.id()} )
ticket2.save()

ticket3 = Ticket.new( {'customer_id'=>customer1.id(), 'screening_id'=>screening2.id()} )
ticket3.save()

ticket4 = Ticket.new( {'customer_id'=>customer2.id(), 'screening_id'=>screening2.id()} )
ticket4.save()



################################################

item1 = Item.new( {'name'=>'Crisps', 'price'=>2, 'stock_quantity'=>10} )
item1.save()

item2 = Item.new( {'name'=>'Popcorn', 'price'=>4, 'stock_quantity'=>10} )
item2.save()

item3 = Item.new( {'name'=>'Chocolate', 'price'=>1, 'stock_quantity'=>10} )
item3.save()

item4 = Item.new( {'name'=>'Coke', 'price'=>3, 'stock_quantity'=>10} )
item4.save()

item5 = Item.new( {'name'=>'Water', 'price'=>2, 'stock_quantity'=>10} )
item5.save()

item6 = Item.new( {'name'=>'Ice Cream', 'price'=>4, 'stock_quantity'=>1} )

binding.pry
nil
