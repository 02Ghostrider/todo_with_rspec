# Instructions

## Download & Setup

- Clone the repo: `git clone https://github.com/NextLevelRails-winter-2016/todo_with_rspec.git`
- Navigate into the app: `cd todo_with_rspec`
- Create a new branch to work with: `git checkout -b YOUR_INTIALS_HERE_branch`
- Install dependencies and create/migrate your database: 
    - `bundle install`
    - `rake db:migrate`
- Run Guard for automated testing `bundle exec guard`

## Test Order

1. Start by testing your Task Model
  - Navigate to: `spec/models/task_spec.rb` 
  - Press `enter` or save the task file to run your tests
  - Write passing code in `app/models/task.rb`
2. Test your Tasks Controller
 - Navigate to: `spec/controllers/tasks_controller_spec.rb`
 - run your tests
 - write passing code in `app/controllers/tasks_controller.rb`
3. Test your routes
  - Navigate to `spec/routing/tasks_routing_spec.rb`
  - run the tests
  - write passing code in your `routes.rb` file
4. Test your views
  - Navigate to `spec/features/tasks_spec.rb`
  - run the tests
  - write the passing code in `app/views/tasks`
  
 ## Notes
 
 You are **not** allowed to use your browser for any testing
