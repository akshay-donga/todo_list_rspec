require 'rails_helper'

RSpec.describe PostsController, type: :request do
  let!(:user) {FactoryGirl.create(:user)}
  let!(:post_one) {FactoryGirl.create(:post, title: 'First Post', user: user)}
  let!(:post_two) {FactoryGirl.create(:post, user: user)}

  # let(:invalid_attributes) { create(:post, title: '')}
  
  describe "GET #index" do
    let(:path) {posts_path}
    it "returns a success response" do
      get path
      expect(Post.count).to eq(2)
    end
  end
  
  describe "GET #show" do
    it "returns a success response" do
      get post_path(id: post_one.id)
      expect(response).to be_successful
      json_response = JSON.parse(response.body)
      expect(json_response["user_id"]).to eq(post_one.user_id)
      expect(json_response["title"]).to eq(post_one.title)
      expect(json_response["content"]).to eq(post_one.content)
    end
  end
  
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

    context "with valid params" do
      subject { post '/api/posts', params: params }

      it "creates a new Post" do
        expect { subject }.to change(Post, :count).by(1)
        json_response = JSON.parse(response.body)
        expect(response).to be_created
        expect(response.location).to eq(post_url(Post.last))

        post = user.posts.last
        expect(post.title).to eq("first post")
        expect(post.content).to eq("this is first post")
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new post" do
        post '/api/posts', params: {post: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let! (:new_params) do
        {
          user_id: user.id,
          title: 'first updated post',
          content: 'this is first updated post'
        }
      end
      let (:path) { post_path(id: post_one.id, post: new_params) }
      let (:update_post) { put path }

      it "updates the requested post" do
        update_post
        expect { post_one.reload }.to change(post_one, :title).to("first updated post").and change(post_one, :content).to("this is first updated post")
      end

      it "renders a JSON response with the post attibutes" do
        put post_path(id: post_two.id, post: new_params)
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the post" do
        put post_path(id: post_one.id, post: {title: ''})
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    subject { delete post_path(id:  post_one.id) }

    it "destroys the requested api/post" do
      expect { subject }.to change(Post, :count).by(-1)
      expect(response).to be_successful
    end
  end
end
