class Article < ApplicationRecord
    paginates_per 3
    def to_param
        slug
    end

    has_many :comments, dependent: :destroy
    validates :title, presence: true,
    length: { minimum: 5 }
    validates :slug, uniqueness: true
    # validates :text, presence: true
end
