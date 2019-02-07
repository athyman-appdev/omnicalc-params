class CalcController < ApplicationController
    def home_page
        render("calc_templates/word_count_entry.html.erb")
    end
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
   
    def random_form_results
       
       @the_minimum = params.fetch("user_minimum").to_f
       @the_maximum = params.fetch("user_maximum").to_f
       @the_random = rand(@the_minimum..@the_maximum)
       
       render("calc_templates/random_results.html.erb")
    end
   
   def random_form_entry
       render("calc_templates/random_form_entry.html.erb")
   end
   
    def word_count_results
       
       @word_count_input = params.fetch("word_count_input")
       @special_word = params.fetch("special_word")

       @word_count_input_downcase = params.fetch("word_count_input").downcase
       @special_word_downcase = params.fetch("special_word").downcase
       
       @special_word_count = @word_count_input_downcase.scan(@special_word_downcase).count
       
       render("calc_templates/word_count_results.html.erb")
    end
   
   def word_count_entry
       render("calc_templates/word_count_entry.html.erb")
   end
   
    def desc_results
        
        @the_numbers = params.fetch("user_number").split.map(&:to_f)
        @sorted_numbers = @the_numbers.sort
        @counted_numbers = @the_numbers.count
        @the_minimum = @the_numbers.min
        @the_maximum = @the_numbers.max
        @the_range = (@the_maximum - @the_minimum)
        
        if @counted_numbers % 2 == 0
            @median = (@sorted_numbers[@counted_numbers/2] + @sorted_numbers[((@counted_numbers/2)-1)])/2
            else @median = @sorted_numbers[(@counted_numbers)/2]
        end
       
        @the_sum = 0
            @the_numbers.each do |num|
            @the_sum += num
        end
        
        @the_mean = (@the_sum / @counted_numbers)
        
        @diffs = []
        @squared_diffs = []
        
        @the_numbers.each do |num|
        diff = num - @the_mean
        @diffs.push(diff)
        end
        
        @diffs.each do |diff|
        sqdif = diff * diff
        @squared_diffs.push(sqdif)
        end
        
        @count_of_squared_diffs = @squared_diffs.count 
        @sum_of_squared_diffs = 0
        @squared_diffs.each do |sqdif|
        @sum_of_squared_diffs += sqdif
        end
        @variance = @sum_of_squared_diffs/@count_of_squared_diffs
        @standard_deviation = Math.sqrt(@variance)
        
        @count_of_numbers = []
  
        @the_numbers.each do |num|
            @num_count = @the_numbers.count(num)
            @count_of_numbers.push(@num_count)
        end
        
        @most_occurrences = @count_of_numbers.max
        @index_of_most_occurrences = @count_of_numbers.index(@most_occurrences)
        @mode = @the_numbers.at(@index_of_most_occurrences)
        
       render("calc_templates/descriptive_stats_results.html.erb")
    end
   
   def desc_entry
       render("calc_templates/descriptive_stats_form_entry.html.erb")
   end
    
end