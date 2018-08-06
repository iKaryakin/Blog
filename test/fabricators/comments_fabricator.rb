Fabricator(:comment) do
    commenter { Faker::Name.name }
    body { Faker::Pokemon.move }
end