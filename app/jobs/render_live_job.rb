class RenderLiveJob < ApplicationJob
    queue_as :default
  
  #   def perform(message)
  #     ActionCable.server.broadcast 'comments_channel', message: render_message(message)
  #   end
  
  #   private
  #     def render_message(message)
  #       ApplicationController.renderer.render(partial: 'comments/comment', locals: { comment: message })
  #     end
  # end
  
    def perform(comment)
      ActionCable.server.broadcast "article:#{comment[:article_id]}:comments", message: render_comment(comment)
    end
  
    private
      def render_comment(comment)
        ApplicationController.renderer.render(partial: 'comments/script', locals: { comment: comment })
      end
  end