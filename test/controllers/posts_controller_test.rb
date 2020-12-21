# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  # test "should get show" do
  #   get posts_show_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get posts_new_url
  #   assert_response :success
  # end

  # test "should get create" do
  #   get posts_create_url
  #   assert_response :success
  # end

  # test "should get update" do
  #   get posts_update_url
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get posts_destroy_url
  #   assert_response :success
  # end

  test 'should create post' do
    post = Post.new(
      title: 'MyString',
      content: 'MyText',
      post_category_id: 1,
      user_id: 1
    )
    assert_not post.save
  end

  test 'should create and delete post' do
    post = Post.create(
      title: 'MyString',
      content: 'MyText',
      post_category_id: 1,
      user_id: 1
    )
    assert post.destroy
  end

  test 'should create comment on post' do
    assert Comment.create(comment: 'MyString')
  end

  test 'should create and delete comment on post' do
    assert Comment.create(comment: 'MyString').destroy
  end
end
