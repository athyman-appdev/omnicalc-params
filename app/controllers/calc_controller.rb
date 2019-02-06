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
        @the_apr = params.fetch("user_rate").to_f/100
        @the_years = params.fetch("user_years").to_f
        @the_principal = params.fetch("user_principal").to_f
        @months = @the_years*12
        @apr_monthly = @the_apr/12
        @apr_monthly_actual = @apr_monthly/100
        @numerator = @apr_monthly_actual*@the_principal.to_f
        @denominator = 1-((1+@apr_monthly_actual)**(-@months).to_f)    
        @monthly_payment = (@numerator/@denominator).round(2)        
        render("calc_templates/flexible_payment.html.erb")
   end
   
   def square_form_results
       
       @the_input_number = params.fetch("user_number").to_f
       
       @the_answer = @the_input_number**2
       
       render("calc_templates/square_results.html.erb")
   end
   
   def square_form_entry
       render("calc_templates/square_form_entry.html.erb")
   end
   
   def square_root_form_results
       
       @the_input_number = params.fetch("user_number").to_f
       
       @the_answer = @the_input_number**0.5
       
       render("calc_templates/square_root_results.html.erb")
   end
   
   def square_root_form_entry
       render("calc_templates/square_root_form_entry.html.erb")
   end
   
   def payment_form_results
       
    #apr_monthly = apr.to_f/12
    #apr_monthly_actual = apr_monthly/100
 # months = years*12
 # numerator = apr_monthly_actual*principal.to_f
 # denominator = 1-((1+apr_monthly_actual)**(-months).to_f)
 # monthly_payment = (numerator/denominator).round(2)
        @the_apr = params.fetch("user_rate").to_f
        @the_years = params.fetch("user_years").to_f
        @the_principal = params.fetch("user_principal").to_f
        @months = @the_years*12
        @apr_monthly = @the_apr/12
        @apr_monthly_actual = @apr_monthly/100
        @numerator = @apr_monthly_actual*@the_principal.to_f
        @denominator = 1-((1+@apr_monthly_actual)**(-@months).to_f)    
        @monthly_payment = (@numerator/@denominator).round(2)
        
        
       render("calc_templates/payment_results.html.erb")
   end
   
   def payment_form_entry
       render("calc_templates/payment_form_entry.html.erb")
   end
    
    def flex_random
        @the_minimum = params.fetch("minimum").to_i
        @the_maximum = params.fetch("maximum").to_i
        @the_random = rand(@the_minimum..@the_maximum)
        
        
       render("calc_templates/flexible_random.html.erb")
    end
    
end