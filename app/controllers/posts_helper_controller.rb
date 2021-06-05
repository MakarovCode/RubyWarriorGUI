class PostsHelperController < ApplicationController
	def evaluate_sum	
		user_post = ForemUserPost.find_by(user_id: forem_user.id, forem_post_id: params[:id])		

		post = Forem::Post.find_by(id: params[:id])	
		post_evaluated = post.evaluated.to_i
		post_evaluated = post_evaluated + 1	
		
		if user_post.nil? 						
			ForemUserPost.create(user_id: forem_user.id, forem_post_id: post.id, evaluated: 1)
			post.evaluated = post_evaluated
			post.save			
		else
			post.evaluated = post_evaluated
			post.save
		end
		redirect_to forem.forum_topic_path(post.topic.forum, post.topic)
		# redirect_to session.delete(:return_to)
	end

	def evaluate_substraction
		user_post = ForemUserPost.find_by(user_id: forem_user.id, forem_post_id: params[:id])		

		post = Forem::Post.find_by(id: params[:id])			
		post_evaluated = post.evaluated.to_i
		post_evaluated = post_evaluated - 1	
		
		if user_post.nil? 						
			ForemUserPost.create(user_id: forem_user.id, forem_post_id: post.id, evaluated: -1)
			post.evaluated = post_evaluated
			post.save
		else
			post.evaluated = post_evaluated
			post.save
		end
		redirect_to forem.forum_topic_path(post.topic.forum, post.topic)
	
	end

end
