App.comments = App.cable.subscriptions.create "CommentsChannel",
  # collection: -> $("[data-channel='comments']")
  collection: -> $("[data-article-id]")

  connected: ->
    # @perform 'speak', message: "ping"
    setTimeout =>
      @followCurrentArticle()
    , 1000

  disconnected: ->

  followCurrentArticle: ->
    articleId = @collection().data('article-id')
    # if articleSlug
      # @perform 'initilize', article_slug: articleSlug
    # articleId = @collection().data('article-id')
    # @perform 'follow'#, article_id: articleId
    if articleId
      @perform 'follow', article_id: articleId
    # else
    #   @perform 'unsubscribed', article_id: articleId

  received: (data) ->
    $('#comments').append data['message']

    # alert data['mail']

#   ping: (mail) ->
#     @perform 'pong', mail: 'ping'
  
#   speak: (comment) -> 
#     articleId = @collection().data('article-id')
#     if articleId
#       @perform 'speak', comment: comment, article_id: articleId

# $(document).on 'keyup', '[id~=comment_commenter]', (event) ->
#   if event.keyCode is 13 # return = send
#     App.comments.speak event.target.value 
#     event.target.value = ''
#     event.preventDefault()
#   else 
#     App.comments.speak event.target.value 


# $(document).on 'keypress', '[data-behavior~=comment_speaker]', (event) ->
#   if event.keyCode is 13 # return = send
#     App.comments.speak event.target.value 
#     event.target.value = ''
#     event.preventDefault()