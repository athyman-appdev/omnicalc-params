class CalcController < ApplicationController
    
    def flex_square
        @flex_square = params.fetch("the_num").to_i
            
        render("calc_templates/flexible_square.html.erb")
    end
    
    def flex_square_root
        @flex_square_root = params.fetch("the_root").to_f
        
        @the_root = @flex_square_root**0.5
            
        render("calc_templates/flexible_square_root.html.erb")
    end
   
   def flex_payment
#        @the_rate = params.fetch("the_rate").to_f/100
        
#        @the_years = params.fetch("the_years").to_f/12
        
   #     @
            
        render("calc_templates/flexible_square.html.erb")
   end
   
   def square_form_results
       
       @the_input_number = params.fetch("user_number").to_f
       
       @the_answer = @the_input_number**2
       
       render("calc_templates/square_results.html.erb")
   end
   
   def square_form_entry
       
       
       
       render("calc_templates/square_form_entry.html.erb")
   end
    
end