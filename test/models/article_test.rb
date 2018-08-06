require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  def setup 
    @article = Fabricate(:article, slug: 'mouse', title: 'Hate-cats')
  end

  # test "the truth" do
  #   assert true
  # end

  test "should not save article without title" do
    # @article = Article.new
    assert_not @article.save, "Saved the article without a title"
  end
  
end
