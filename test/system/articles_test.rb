require 'test_helper'
require "application_system_test_case"


class ArticlesTest < ApplicationSystemTestCase

  # def setup
  #   request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.
  #   encode_credentials('dhh', 'secret')
  # end

  # test "visiting the index" do
  #   visit articles_url
  #
  #   assert_selector "h1", text: "Articles"
  # end

  # test "viewing the index" do
  #   visit articles_path
  #   assert_selector "h1", text: "Listing articles"
  # end 

  test "creating an article" do
    # get 'index'
    visit articles_path

    # click_on "New article"
    # visit "articles/new"
    # visit "http://dhh:secret@articles/new"
    # visit "http://dhh:secret@127.0.0.1/articles/new"
    click_on "New article"

    fill_in "article[title]", with: "Creating an Article"
    fill_in "article[text]", with: "Created this article successfully!"
   
    click_on "Create Article"
   
    assert_text "Creating an Article"
  end

  
end
