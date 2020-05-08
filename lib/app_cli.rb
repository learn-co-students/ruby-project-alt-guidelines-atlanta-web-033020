require 'pry'

class AppCli

    def login
        puts "To login, type in your student id number from the list below: "
        Student.all.each do |stud|
            puts "ID# #{stud.id}: #{stud.name}"
        end
        id_this_student = gets.chomp

        if Student.find_by(id: id_this_student) == nil
            puts "Please enter a valid ID number."
            return login
        end
        this_student = Student.find_by(id: id_this_student)

        #greeting(this_student)
        #this_student
    end

    def greeting(this_student)  
     
        puts "Hi, *** #{this_student.name} ***! Let's sharpen your English skills."
    end

    def lists_reviews
        Review.all.each do |rev|
            puts "#{rev.id}: #{rev.comment}"
        end
    end

    def lists_stories 
        Story.all.each do |stor|
            puts "ID# #{stor.id}: #{stor.title}"
        end
    end
    
    def review_a_story(this_student)

        puts "Ready to review a story? Please type in a story ID number from the list below."

        lists_stories
        
        id_story_to_review = gets.chomp

        if Story.find_by(id: id_story_to_review) == nil
            puts "Please enter a valid ID number."
            return review_a_story(this_student)
        end
        story_to_review = Story.find_by(id: id_story_to_review)

        puts "Please enter your review for #{story_to_review.title}."
        rev_input = gets.chomp

        this_review = Review.create(student: this_student, story: story_to_review, comment: rev_input)

        puts "Thank you for your review!"
        puts "ID# #{this_review.id}: #{this_review.story.title} REVIEW #{this_review.comment}"

    end

    def select_a_student(this_student)
        puts "#{this_student.name}, select a student ID number to see all the reviews by that student: "
        Student.all.each do |stud|
            puts "ID# #{stud.id}: #{stud.name}"
        end
        id_student_rev = gets.chomp

        if Student.find_by(id: id_student_rev) == nil
            puts "Please enter a valid ID number."
            return select_a_student(this_student)
        end
        student_rev = Student.find_by(id: id_student_rev)

        # Array of all reviews by the selected student
        rev_by_student_rev = Review.all.where(student: student_rev)

        all_reviews_by_a_student(student_rev, rev_by_student_rev)
        all_story_titles_reviewed_by_a_student(student_rev, rev_by_student_rev)
        all_story_titles_and_reviews_by_a_student(student_rev, rev_by_student_rev)
    end

    def all_reviews_by_a_student(student_rev, rev_by_student_rev)
        puts "ALL REVIEWS by #{student_rev.name}:"
        rev_by_student_rev.map { |rev| puts "#{rev.comment}" }
    end

    def all_story_titles_reviewed_by_a_student(student_rev, rev_by_student_rev)
        puts "ALL STORY TITLES reviewed by #{student_rev.name}:"
        rev_by_student_rev.map { |rev| puts "#{rev.story.title}" }
    end

    def all_story_titles_and_reviews_by_a_student(student_rev, rev_by_student_rev)
        puts "ALL REVIEWS WITH CORRESPONDING STORY TITLES by #{student_rev.name}:"
        rev_by_student_rev.map { |rev| puts "#{rev.story.title}: #{rev.comment}" }
    end




    def select_a_story(this_student)

        puts "#{this_student.name}, do you want to see all the reviews for a story?  Select a story title, then type in the corresponding ID number: "
        Story.all.each do |stud|
            puts "ID# #{stud.id}: #{stud.title}"
        end
        id_story_rev = gets.chomp

        if Story.find_by(id: id_story_rev) == nil
            puts "Please enter a valid ID number."
            return select_a_story(this_student)
        end
        story_rev = Story.find_by(id: id_story_rev)

        # Array of all the reviews for the selected story
        rev_for_story_rev = Review.all.where(story: story_rev)

        all_reviews_on_a_story(story_rev, rev_for_story_rev)
        all_reviewers_for_a_story(story_rev, rev_for_story_rev)
        all_reviewers_and_reviews_for_a_story(story_rev, rev_for_story_rev)

    end

    def all_reviews_on_a_story(story_rev, rev_for_story_rev)
        puts "ALL REVIEWS for the story, #{story_rev.title}:"
        rev_for_story_rev.map { |rev| puts "#{rev.comment}"}
    end

    def all_reviewers_for_a_story(story_rev, rev_for_story_rev)
        puts "ALL REVIEWERS for the story, #{story_rev.title}:"
        rev_for_story_rev.map { |rev| puts "#{rev.student.name}"}
    end

    def all_reviewers_and_reviews_for_a_story(story_rev, rev_for_story_rev)
        puts "ALL REVIEWERS WITH CORRESPONDING REVIEWS for the story, #{story_rev.title}:"
        rev_for_story_rev.map { |rev| puts "#{rev.student.name}: #{rev.comment}"}
    end

    # def reviews_by_this_student(this_student)
    #     this_student.reviews
    # end

    def select_one_of_your_reviews(this_student)
        puts "Having second thoughts about one of your reviews? Your reviews are listed below. To change a review, type in the corresponding ID number:"
        this_student.reviews.each do |rev|
            puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
        end
        id_change_rev = gets.chomp

        if Review.find_by(id: id_change_rev) == nil
            puts "Please enter a valid ID number."
            return select_one_of_your_reviews(this_student)
        end
        change_rev = Review.find_by(id: id_change_rev)

        change_review(this_student, change_rev)
    end

    def change_review(this_student, change_rev)
        puts "This is the review you selected to change: #{change_rev.story.title}: #{change_rev.comment}"
        puts "Copy/paste and then edit your original review or re-write the review."
        revised_review = gets.chomp

        change_rev.comment = revised_review
        change_rev.save
        this_student.reload

        confirm_review_change(this_student)
    end

    def confirm_review_change(this_student)
        puts "Your changes have been saved, thank you."
        this_student.reviews.each do |rev|
            puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
        end
    end

    def select_review_to_delete(this_student)
        puts "You have #{this_student.reviews.length} reviews, #{this_student.name}. To delete one, type in the corresponding ID number:"
        #puts "Do you want to get rid of a review? Type in the ID number of the review you want to delete."

        this_student.reviews.each do |rev|
            puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
        end
        id_delete_rev = gets.chomp

        if Review.find_by(id: id_delete_rev) == nil
            puts "Please enter a valid ID number."
            return select_review_to_delete(this_student)
        end
        delete_rev = Review.find_by(id: id_delete_rev)

        delete_review(this_student, delete_rev)
    end

    def delete_review(this_student, delete_rev)
        puts "Is this the review you want to delete? Type: YES or NO: #{delete_rev.story.title}: #{delete_rev.comment}"

        #puts "Type YES if this is the review you want to delete. #{delete_rev.story.title}: #{delete_rev.comment}"
        delete_this_rev = gets.chomp.upcase 

        if delete_this_rev == "YES"
            delete_rev.destroy
        elsif delete_this_rev == "NO"
            return puts "Good choice. That review speaks truth!"
        else
            puts "Please type YES or NO."
            return delete_review(this_student, delete_rev)
        end

        this_student.reload
        confirm_review_deleted(this_student)
    end

    def confirm_review_deleted(this_student)
        puts "Your review has been deleted. You now have #{this_student.reviews.length} reviews."
        this_student.reviews.each do |rev|
            puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
        end
    end

    def adios
        puts "THANKS FOR VISITING: Come back soon for more English practice with English Reads!"
        puts "To see a list of all reviews with corresponding reviewers, type YES:"
        #input = gets.chomp.upcase

        wanna_see_reviews #(input)
    end

    def wanna_see_reviews #(input)
        input = gets.chomp.upcase

        if input == "YES"
            lists_all_students_story_reviews
        elsif input == "NO"
            return puts "Looking forward to seeing you next time, here at English Reads!"
        else
            puts "Please type YES or NO:"
            return wanna_see_reviews #(input)
        end
    end

    def lists_all_students_story_reviews
        
        puts ":REVIEWS: Reviews listed with the student reviewer and the story reviewed :REVIEWS:"
        Review.all.each do |rev|
#binding.pry
            puts "ID# #{rev.id}: #{rev.student.name} reviewed the story #{rev.story.title}:  #{rev.comment}"
        end

        puts "That's all, folks!"
    end







    
    
    def run
        puts "Welcome to English Reads, the best resource for practicing English in the world!"       
        this_student = login
    
        greeting(this_student)
        

        ########### Create: Review a story ###########

       puts "======================================================================================================="

       review_a_story(this_student)

        puts "======================================================================================================="

        ########### END Create: Review a story ###########


        ########### List reviews by a student ###########

        puts "======================================================================================================="

        select_a_student(this_student)

        puts "======================================================================================================="
        
        ########### END List reviews by a student ###########


        ########### List reviews of a story ###########

        puts "======================================================================================================="
        
        select_a_story(this_student)

        puts "======================================================================================================="
        
        ########### END List reviews of a story ###########


        ########### A student revises one of their review comments ###########

        puts "======================================================================================================="

        select_one_of_your_reviews(this_student)

        puts "======================================================================================================="
           
       ########### END A student revises one of their review comments ###########
       
              
        ########### Delete a review ###########
  
        puts "======================================================================================================="

        select_review_to_delete(this_student)
       
        puts "======================================================================================================="

        ########### END Delete a review ###########


        puts "======================================================================================================="

       # puts "Are you done practicing for now? Type YES or NO:"
        adios

       
        puts "======================================================================================================="




        ########### List ALL review comments with story title and student reviewer ###########
        puts "======================================================================================================="
        puts "======================================================================================================="
        # puts ":REVIEWS: Reviews listed with the student reviewer and the story reviewed :REVIEWS:"          
        #lists_all_students_story_reviews
               
        puts "======================================================================================================="
        puts "======================================================================================================="
   
        ########### END List ALL review comments with story title and student reviewer ###########
    
        

    end
end




























# def login
#     puts "To login, type in your student id number from the list below: "
#     Student.all.each do |stud|
#         puts "ID# #{stud.id}: #{stud.name}"
#     end
#     id_this_student = gets.chomp

#     if Student.find_by(id: id_this_student) == nil
#         puts "Please enter a valid ID number."
#         login
#     else
#     this_student = Student.find_by(id: id_this_student)
#     end

#     #greeting(this_student)
#     #this_student
# end



# def review_a_story(this_student)

#     puts "Ready to review a story? Please type in a story ID number from the list below."

#     lists_stories
    
#     id_story_to_review = gets.chomp
#     story_to_review = nil

#     if Story.find_by(id: id_story_to_review) == nil
#         puts "Please enter a valid ID number."
#         review_a_story(this_student)
#     else
#     story_to_review = Story.find_by(id: id_story_to_review)
#     end

#     puts "Please enter your review for #{story_to_review.title}."

#     rev_input = gets.chomp

#     this_review = Review.create(student: this_student, story: story_to_review, comment: rev_input)

#     puts "Thank you for your review!"

# end

























# class AppCli
    
    
#     def run
#         puts "Welcome to English Reads, the best resource for practicing English in the world!"

#         puts "To login, type in your student id number from the list below: "
#         Student.all.each do |stud|
#             puts "ID# #{stud.id}: #{stud.name}"
#         end
#         id_this_student = gets.chomp
#         this_student = Student.find_by(id: id_this_student)

#         puts "Hi, #{this_student.name}."




#         ########### List ALL review comments with story title and student reviewer ###########

#         puts "======================================================================================================="
            
#             puts "This is a list of all the reviews, listed with the student reviewer and the story reviewed."
#             #lists_student_story_reviews
#             Review.all.each do |rev|
#                 puts "#{rev.student.name} reviewed the story #{rev.story.title}:  #{rev.comment}"
#             end
           
#         puts "======================================================================================================="

#         ########### END List ALL review comments with story title and student reviewer ###########


#         ########### Create: Review a story ###########

#        puts "======================================================================================================="

#         puts "Ready to review a story, #{this_student.name}? Please type in a story ID number from the list below."

#         #lists_stories
#         Story.all.each do |stor|
#             puts "ID# #{stor.id}: #{stor.title}"
#         end

#         id_story_to_review = gets.chomp
#         story_to_review = Story.find_by(id: id_story_to_review)

#         puts "Please enter your review for #{story_to_review.title}."
#         rev_input = gets.chomp

#         this_review = Review.create(student: this_student, story: story_to_review, comment: rev_input)

#         puts "Thank you for your review!"

#         puts "======================================================================================================="

#         ########### END Create: Review a story ###########


#         ########### List reviews by a student ###########

#         puts "======================================================================================================="

#         puts "#{this_student.name}, select a student ID number to view all the reviews for that student: "
#         Student.all.each do |stud|
#             puts "ID# #{stud.id}: #{stud.name}"
#         end
#         id_student_rev = gets.chomp
#         student_rev = Student.find_by(id: id_student_rev)
#         rev_by_student_rev = Review.all.where(student: student_rev)
                
#         puts "Here are all of #{student_rev.name}'s reviews:"
#         rev_by_student_rev.map { |rev| puts "#{rev.comment}" }

#         puts "Here are all the story titles that #{student_rev.name} reviewed:"
#         rev_by_student_rev.map { |rev| puts "#{rev.story.title}" }

#         puts "Here are all of #{student_rev.name}'s reviews with the corresponding story titles:"
#         rev_by_student_rev.map { |rev| puts "#{rev.story.title}: #{rev.comment}" }

#         puts "======================================================================================================="
        
#         ########### END List reviews by a student ###########


#         ########### List reviews of a story ###########

#         puts "======================================================================================================="
        
#         puts "Select a story title then type in the corresponding ID number to view all the reviews for that story: "
#         Story.all.each do |stud|
#             puts "ID# #{stud.id}: #{stud.title}"
#         end
#         id_story_rev = gets.chomp
#         story_rev = Story.find_by(id: id_story_rev)
#         rev_for_story_rev = Review.all.where(story: story_rev)

#         puts "Here are all the reviews for the story: #{story_rev.title}"
#         rev_for_story_rev.map { |rev| puts "#{rev.comment}"}

#         puts "Here are all the reviewers for the story: #{story_rev.title}"
#         rev_for_story_rev.map { |rev| puts "#{rev.student.name}"}

#         puts "Here are all the reviewers with their corresponding reviews for the story: #{story_rev.title}"
#         rev_for_story_rev.map { |rev| puts "#{rev.student.name}: #{rev.comment}"}

#         puts "======================================================================================================="
        
#         ########### END List reviews of a story ###########


#         ########### A student revises one of their review comments ###########

#         puts "======================================================================================================="

#         puts "Having second thoughts about one of your reviews? Well, they're all listed below. To change a review, type in the corresponding ID number:"
#         this_student.reviews.each do |rev|
#             puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
#         end
#         id_change_rev = gets.chomp
#         change_rev = Review.find_by(id: id_change_rev)

#         puts "This is the review you selected to change: #{change_rev.story.title}: #{change_rev.comment}"
#         puts "Copy/paste and then edit your original review or re-write the review."
#         revised_review = gets.chomp

#         change_rev.comment = revised_review
#         change_rev.save
#         this_student.reload

#         puts "Your changes have been saved, thank you."
#         this_student.reviews.each do |rev|
#             puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
#         end

#         puts "======================================================================================================="
           
#        ########### END A student revises one of their review comments ###########
       
              
#         ########### Delete a review ###########
  
#         puts "======================================================================================================="

#         puts "Do you want to get rid of a review? Type in the ID number of the review you want to delete."

#         this_student.reviews.each do |rev|
#             puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
#         end
#         id_delete_rev = gets.chomp
#         delete_rev = Review.find_by(id: id_delete_rev)

#         puts "Type YES if this is the review you want to delete. #{delete_rev.story.title}: #{delete_rev.comment}"
#         delete_this_rev = gets.chomp.upcase    #.capitalize

#         if delete_this_rev == "YES"
#             delete_rev.destroy
#         end

#         this_student.reload

#         puts "Your review has been deleted."
#         this_student.reviews.each do |rev|
#             puts "ID# #{rev.id}: For the story: #{rev.story.title}, you commented: #{rev.comment}"
#         end

#         puts "======================================================================================================="

#         ########### END Delete a review ###########


        
        

#     end
# end









