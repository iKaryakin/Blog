class CommentsController < ApplicationController

    http_basic_authenticate_with name: "dhh", 
    password: "secret", only: :destroy

    def create
        @article = Article.find_by_slug(params[:article_slug])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
      end

    def destroy
        @article = Article.find_by_slug(params[:article_slug])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end
     
      private
        def comment_params
          params.require(:comment).permit(:commenter, :body, :article_slug)
        end
end
