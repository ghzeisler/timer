class TasksController < ApplicationController
  respond_to :html, :json
  def index
  	@task = Task.new
  	@tasks = Task.all
  end

  def create
    @task = Task.new(params[:task])
    @task.save

      respond_to do |format|
        format.html {redirect_to tasks_path}
        format.json { head :ok}
        format.js
      end

  end

  def edit
  	@task = Task.find params[:id]
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
  		@task = Task.find params[:id]
      @task.update_attributes(params[:task])
  		# if task.update_attributes params[:task]
  		# 	redirect_to tasks_path, :notice => 'Your tasks was updated!'
  		# else
  		# 	if params[:task]["task"].blank?
  		# 		redirect_to :back, notice: 'Error Cannot Update Task no text found!'
  		# 	else
  		# 		redirect_to :back, notice: 'There was an error updating your tasks!'
  		# 	end
  		# end
      respond_with @task
  end

  def destroy
  	@task = Task.find params[:id]
    @task.destroy

    respond_to do |format|
      format.html {redirect_to :back, notice: 'Your Task was Deleted.' }
      format.json { head :ok}
      format.js
    end
  end

  # def convert_date(hash, date_symbol_or_string)
  #   attribute = date_symbol_or_string.to_s
  #   return Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i)
  # end

#   def convert_date_time(hash, date_symbol_or_string)
#     attribute = date_symbol_or_string.to_s
#     return Time.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i,hash[attribute + '(4i)'].to_i,hash[attribute + '(5i)'].to_i)
#  end
 end


