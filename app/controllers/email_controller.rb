class EmailController < ApplicationController
	def index
		@emails = Email.all
	end

	def create
		@mail = Email.create(object: Faker::Book.genre, body: Faker::Book.title)
		@last_nb = Email.all.length
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {}
		end
	end

	def destroy 
		@mail = Email.find(params[:id])
		@mail.destroy
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {}
		end
	end

	def show
		@mail = Email.find(params[:id])
		@mail.update(read: true)
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {}
		end
	end

	def edit
		@mail = Email.find(params[:id])

		if params[:tohide]
			@tohide = params[:tohide]
		else 
			@mail.update(read: false)
			@tohide = false
		end
		
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {}
		end
	end

	def new
		@mail = Email.find(params[:format])
		puts "=" * 50
		puts "YEE"
		puts "=" * 50
		respond_to do |format|
			format.html {redirect_to root_path}
			format.js {}
		end
	end
end
