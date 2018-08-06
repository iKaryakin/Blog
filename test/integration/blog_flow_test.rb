require 'test_helper'

class BlogFlowTest < ActionDispatch::IntegrationTest

  def setup
    @article = Fabricate(:article)
  end
  
  # test "the truth" do
  #   assert true
  # end
  # test "can see the welcome page" do
  #   get "/"
  #   assert_select "h1", "Hello, Rails!"
  # end

  test "can create an article" do
    # basic = ActionController::HttpAuthentication::Basic
    # credentials = basic.encode_credentials('dhh', 'secret')
    # page.driver.header('Authorization', credentials)

    # visit "http://dhh:secret@127.0.0.1/articles/new"

    get "/articles/new"
    assert_response :success
   
    post "/articles",
      params: { article: { slug: "can-create", title: "can create", text: "article successfully." }
    }
      
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\n  can create"


    get "/articles/can-create"
    assert_response :success

    post "/articles/can-create/comments",
      params: { comment: {commenter: "dude", body: "Nice." }
    }

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
