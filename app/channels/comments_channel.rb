class CommentsChannel < ApplicationCable::Channel
    # def subscribed
        # stop_all_streams
        # @article = Article.find_by_slug(data["article_slug"])#params['article_id'])
        # stream_from "comments_channel"
        # stream_from "article:#{params['article_id'].to_i}:comments"
        # stream_from "article:#{$article[:id]}:comments"
    # end
    
    def follow(data)
        # article = Article.find_by_slug(data["article_slug"])
        # stop_all_streams
        stream_from "article:#{data['article_id']}:comments"
    end
  
    def unsubscribed
        # stop_all_streams
    end

    def speak(data)
    #     # ActionCable.server.broadcast "comments_channel", message: data['message'] 
    #     # Comment.create! commenter: 'JoJo', body: data['message']
    #     # @article = Article.find_by_slug(article_slug['article_slug'])
        @article = Article.find(data["article_id"])
        # @comment = @article.comments.find(@article[''])
        @comment = @article.comments.update(commenter: 'JoJo', body: data['comment'])
    end

    # def pong(data)
    #     ActionCable.server.broadcast "comments_channel", mail: 'pong' #data['mail'] 
    # end
end