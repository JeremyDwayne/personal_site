require 'rails_helper'

RSpec.describe Element, type: :model do
  current_author = Author.first_or_create!(email: 'test@test.com', password: 'password',
                                           password_confirmation: 'password')
  post = Post.first_or_create!(title: 'post title', description: 'a' * 50, author: current_author)

  it 'cannot be an elephant' do
    element = Element.new(element_type: 'elephant', post: post)
    expect(element).to_not be_valid
  end
  it 'can be a paragraph' do
    element = Element.new(element_type: 'paragraph', post: post)
    expect(element.element_type).to eq('paragraph')
  end
  it 'can be an image' do
    element = Element.new(element_type: 'image', post: post)
    expect(element.element_type).to eq('image')
  end
  it 'can be a video-embed' do
    element = Element.new(element_type: 'video-embed', post: post)
    expect(element.element_type).to eq('video-embed')
  end
  it 'can change positions in the post' do
    element1 = post.elements.new(element_type: 'paragraph')
    element2 = post.elements.new(element_type: 'image')
    element1.position = 0
    element2.position = 1
    expect(element1.position).to eq(0)
    expect(element2.position).to eq(1)
  end
end
