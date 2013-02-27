require 'spec_helper'

describe "Tasks" do
	before do
		@task = Task.create! task: 'go to bed'
	end

  	describe "GET /tasks" do
	  	it "display some tasks" do
	  		visit tasks_path
	  		within ".task_list" do
	  			page.should have_content 'go to bed'
	  		end
	  	end
	end
	  	it "creates a new task" do
	  		visit tasks_path
	  		fill_in 'Task', with: "Goto work"
	  		click_button "Create Task"

	  		current_path.should == tasks_path
	  		page.should have_content 'Goto work'
	  		# save_and_open_page
	  	end


	describe "Put /tasks" do
		it "edits a task" do
			visit tasks_path
			click_link "Edit"

			current_path.should == edit_task_path(@task)

			#page.should have_content 'go to bed'
			find_field('Task').value.should == 'go to bed'

			fill_in 'Task', with: 'updated task'
			click_button 'Update Task'
			page.should have_content 'updated task'
		end

		it "should not update an empty task" do
			visit tasks_path
			click_link 'Edit'

			fill_in 'Task', with: ''
			click_button 'Update Task'
			current_path.should == edit_task_path(@task)
			page.should have_content 'Error Cannot Update Task no text found!'
		end
	end

	describe "Delete /tasks" do
		it "should delete a task" do
			visit tasks_path
			find("#task_#{@task.id}").click_link 'Delete'
			page.should have_content 'Task has been deleted!'
			page.should have_no_content 'go to bed'
		end
	end
end
