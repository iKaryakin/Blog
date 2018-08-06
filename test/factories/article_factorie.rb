FactoryBot.define do

    factory :comment do
        commenter { Faker::Name.name }
        body { Faker::Pokemon.move }
        article
    end

    factory :article do
        title { Faker::Name.name }
        slug { |attrs| "#{attrs[:title].parameterize}" }
        text { Faker::Beer.name }
  
      factory :article_long do
        transient do
          comment_count 5
        end
        
        after(:create) do |article, evaluator|
          create_list(:comment, evaluator.comment_count, article: article)
        end
      end
    end
  end