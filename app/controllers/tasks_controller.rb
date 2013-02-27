class TasksController < ApplicationController
  def index
  	@task = Task.new
  	@tasks = Task.all
  end

  def create

  		if params[:task]["task"].blank?
  				redirect_to :back, notice: 'Error Cannot Create Task no text found!'
  		else
  			date_time = convert_date_time(params[:task], :date_time)
  			Task.create(params[:task],date_time:date_time)
  			redirect_to tasks_path
  		end
  end

  def edit
  		@task = Task.find params[:id]
  end

  def update
  		task = Task.find params[:id]
  		if task.update_attributes params[:task]
  			redirect_to tasks_path, notice: 'Your tasks was updated!'
  		else
  			if params[:task]["task"].blank?
  				redirect_to :back, notice: 'Error Cannot Update Task no text found!'
  			else
  				redirect_to :back, notice: 'There was an error updating your tasks!'
  			end
  		end
  end

  def destroy
  	Task.destroy params[:id]
  		redirect_to :back, notice: 'Task has been deleted!'
  end

  def convert_date(hash, date_symbol_or_string)
    attribute = date_symbol_or_string.to_s
    return Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i)
  end

  def convert_date_time(hash, date_symbol_or_string)
    attribute = date_symbol_or_string.to_s
    return Time.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i,hash[attribute + '(4i)'].to_i,hash[attribute + '(5i)'].to_i)
  end
end


