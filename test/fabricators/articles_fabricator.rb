Fabricator(:article) do
    title { Faker::Name.name }
    slug { |attrs| "#{attrs[:title].parameterize}" }
    text { Faker::Beer.name }
    comments(count: 5)
  end