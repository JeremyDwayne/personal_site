require 'rails_helper'

RSpec.describe Post, type: :model do
  # TODO: extract this into a fixture or test helper file
  current_author = Author.first_or_create!(email: 'test@test.com', password: 'password',
                                           password_confirmation: 'password')

  it 'has a title' do
    post = Post.new(title: '', description: 'a' * 50, author: current_author)
    expect(post).to_not be_valid
    post.title = 'This is a title'
    expect(post).to be_valid
  end

  it 'cannot have an empty description' do
    post = Post.new(title: 'This is a title', description: '', author: current_author)
    expect(post).to_not be_valid
    post.description = 'a' * 50
    expect(post).to be_valid
  end

  it 'has a description at least 50 characters long' do
    post = Post.new(title: 'title', description: 'less than 50', author: current_author)
    expect(post).to_not be_valid
    post.description = 'a' * 50
    expect(post).to be_valid
  end

  it 'has a description at most 250 characters long' do
    post = Post.new(title: 'title', description: 'a' * 252, author: current_author)
    expect(post).to_not be_valid
    post.description = 'a' * 250
    expect(post).to be_valid
  end

  it 'has impressions' do
    post = Post.create(title: 'title', description: 'a' * 50, author: current_author)
    expect(post.impressions.count).to be(0)
    post.impressions.create!
    expect(post.impressions.count).to be(1)
  end
end
