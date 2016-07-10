class JobsController < ApplicationController
	before_action :find_job, only: [:show, :edit, :update, :destroy]
	def index
		@jobs = Job.sorted
	end

	def show
		#@job is already set (before_action)
	end
	def new
		@job = Job.new
	end
	def create
		@job = Job.new(jobs_params)
		#if job is saved, redirect to...
		if @job.save
			redirect_to @job
		else
			render 'new'
		end
	end
	def edit
		#@job is already set (before_action)
	end
	def update
		#@job is already set (before_action)
		if @job.update(jobs_params)
			redirect_to @job
		else
			render 'edit'
		end

	end
	def destroy
		#@job is already set (before_action)
		@job.destroy
		redirect_to root_path
	end


	private
	#permissions and requirments for data verification and security
	def jobs_params
		params.require(:job).permit(:title, :description, :company, :url)
	end
	#look for a job associated with id
	def find_job
		@job = Job.find(params[:id])
	end


end
