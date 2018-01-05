require 'rails_helper'

RSpec.describe TasksController, type: :controller do

  before { sign_in(create(:user)) }

  let(:valid_attributes) {attributes_for(:homework)}
  let(:valid_attributes_2) {attributes_for(:email)}
  let(:invalid_attributes) { attributes_for(:invalid_task) }
  let(:user_with_tasks) { build(:user_with_tasks) }

  describe "unauthenticated" do
    it 'redirects user to login page when not signed in' do
      sign_out(:user)
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe "GET #index" do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
    it 'returns all tasks for user' do
      user = build(:user_with_tasks)
      get :index
      expect(assigns(:tasks)).not_to be_nil
    end
    it "assigns all tasks as @tasks" do
      user = build(:user_with_tasks)
      get :index
      expect(user.tasks.length).to eq(2)
    end
  end

  describe "GET #show" do
    it "assigns the requested task as @task" do
      user = build(:user_with_tasks)
      # expect(user.tasks).to be 1
      task = Task.create(valid_attributes)
      get :show, params: {id: user.tasks[0].to_param}
      expect(assigns(:task)).to eq(task)
    end
    it 'renders the :show template' do
      task = Task.create(valid_attributes)
      get :show, params: {id: task.to_param}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns a new task as @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task as @task" do
      task = Task.create(valid_attributes)
      get :edit, params: {id: task.to_param}
      expect(assigns(:task)).to eq(task)
    end
    it 'renders the :edit template' do
      task = Task.create(valid_attributes_2)
      get :edit, params: {id: task.to_param}
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do

    let(:valid_attributes) {attributes_for(:homework)}
    let(:valid_attributes_2) {attributes_for(:email)}
    let(:invalid_attributes) { attributes_for(:invalid_task) }
    let(:user_with_tasks) { build(:user_with_tasks) }

    context "with valid attributes" do
      it "creates a new Task" do
        expect {
          post :create, params: {task: valid_attributes}
        }.to change(Task, :count).by(1)
      end
      it "assigns a newly created task as @task" do
        post :create, params: {task: valid_attributes}
        expect(assigns(:task)).to be_a(Task)
        expect(assigns(:task)).to be_persisted
      end
      it "redirects to the created task" do
        post :create, params: {task: valid_attributes}
        expect(response).to redirect_to(assigns(:task))
      end
    end

    context "with invalid attributes" do
      it "assigns a newly created but unsaved task as @task" do
        post :create, params: {task: invalid_attributes}
        expect(assigns(:task)).to be_a_new(Task)
      end
      it 'does not persist task' do
        expect{
          post:create, params: { task: invalid_attributes }
        }.not_to change(Task, :count)
      end
      it "re-renders the :new template" do
        post :create, params: {task: invalid_attributes}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do

    let(:valid_attributes) {attributes_for(:homework)}
    let(:valid_attributes_2) {attributes_for(:email)}
    let(:invalid_attributes) { attributes_for(:invalid_task) }
    let(:user_with_tasks) { build(:user_with_tasks) }

    context "with valid params" do
      it "updates the requested task" do
        task = Task.create(valid_attributes)
        put :update, params: {id: task.to_param, task: valid_attributes_2}
        task.reload
        expect(task.name).to eq("Reply to Zack's email")
        expect(task.priority).to eq(2)
      end

      it "assigns the requested task as @task" do
        task = Task.create(valid_attributes)
        put :update, params: {id: task.to_param, task: valid_attributes}
        expect(assigns(:task)).to eq(task)
      end

      it "redirects to the task" do
        task = Task.create(valid_attributes)
        put :update, params: {id: task.to_param, task: valid_attributes}
        expect(response).to redirect_to(task)
      end
    end

    context "with invalid params" do
      it "assigns the task as @task" do
        task = Task.create(valid_attributes)
        put :update, params: {id: task.to_param, task: invalid_attributes}
        expect(assigns(:task)).to eq(task)
      end

      it "re-renders the 'edit' template" do
        task = Task.create(valid_attributes)
        put :update, params: {id: task.to_param, task: invalid_attributes}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = Task.create(valid_attributes)
      expect {
        delete :destroy, params: {id: task.to_param}
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = Task.create(valid_attributes)
      delete :destroy, params: {id: task.to_param}
      expect(response).to redirect_to(tasks_url)
    end
  end

end
