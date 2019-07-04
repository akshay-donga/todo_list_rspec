require 'rails_helper'

RSpec.describe PostsController, type: :request do
  
  let!(:user) {FactoryGirl.create(:user)}
  let(:invalid_attributes) { create(:post, title: '')}
  
  describe "GET #index" do
    let!(:post_one) {FactoryGirl.create(:post)}
    let!(:post_two) {FactoryGirl.create(:post)}
    let(:path) {posts_path}
    it "returns a success response" do
      get path
      expect(Post.count).to eq(2)
    end
  end
  
  # describe "GET #show" do
  #   let(:post) { FactoryGirl.create(:post)}
  
  #   it "returns a success response" do
  #     get post_path(id: post)
  #     expect(response).to be_successful
  #   end
  # end
  
  describe "POST #create" do
    let! (:params) do
      {
        post: {
          user_id: user.id,
          title: 'first post',
          content: 'this is first post'
        }
      }
    end

    describe "with valid params" do
      # let(:post) { post '/api/posts', params: params }

      it "creates a new Post" do
        # expect(response).to be_successful
        expect { Post.count }.to change(Post, :count).by(0)
        post '/api/posts', params: params
        expect { Post.count }.to change(Post, :count).by(1)
      end

      # it "renders a JSON response with the new post" do
      #   record = user.posts.last
      #   expect(record.user_id).to_be eq(user.id)
      #   expect(record.title).to eq('first post')
      #   expect(record.content).to eq('this is first post')

      #   expect(response).to have_http_status(:created)
      #   expect(response.content_type).to eq('application/json')
      #   expect(response.location).to eq(post_url(Post.last))
      # end
    end

    # context "with invalid params" do
    #   it "renders a JSON response with errors for the new post" do

    #     post path, params
    #     expect(response).to have_http_status(:unprocessable_entity)
    #     expect(response.content_type).to eq('application/json')
    #   end
    # end
  end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested post" do
  #       post = Post.create! valid_attributes
  #       put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
  #       post.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "renders a JSON response with the post" do
  #       post = Post.create! valid_attributes

  #       put :update, params: {id: post.to_param, post: valid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end

  #   context "with invalid params" do
  #     it "renders a JSON response with errors for the post" do
  #       post = Post.create! valid_attributes

  #       put :update, params: {id: post.to_param, post: invalid_attributes}, session: valid_session
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq('application/json')
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   let (:post) {FactoryGirl.create(:post)}
  #   it "destroys the requested api/post" do
  #     expect {
  #       delete :destroy, params: {id: post.to_param}
  #     }.to change(Post, :count).by(-1)
  #   end
  # end

end
