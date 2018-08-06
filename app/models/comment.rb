class Comment < ApplicationRecord
  belongs_to :article
  validates :commenter, presence: true
  
  after_create_commit { RenderCommentJob.perform_later self }
  # after_update_commit { RenderLiveJob.perform_later self }
  # after
end
