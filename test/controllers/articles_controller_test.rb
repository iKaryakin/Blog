require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  setup do
    # @article = Fabricate(:article)
    @article = create(:article_long)

    # request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.
    # encode_credentials('dhh', 'secret')
  end
 
  teardown do
    Rails.cache.clear
  end
 
  test "should show article" do
    get :show,
      params: {slug: @article}
    assert_response :success
  end
 
  test "should destroy article" do
    delete :destroy,
      params: {slug: @article}
    assert_response :redirect
 
    assert_redirected_to articles_path
  end
 
  test "should update article" do
    patch :update, 
      params: { 
        slug: @article,
        article: { title: "updated", text: "article successfully." } 
    }
 
    assert_redirected_to article_path(@article)
    @article.reload
    assert_equal "updated", @article.title
  end
end