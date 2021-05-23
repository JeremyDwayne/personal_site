require 'rails_helper'

RSpec.describe 'authors/posts/edit', type: :view do
  # TODO: extract this into a fixture or test helper file
  current_author = Author.first_or_create!(email: 'test@test.com', password: 'password',
                                           password_confirmation: 'password')

  before(:each) do
    @post = assign(:post, Post.create!(
                            title: 'MyString',
                            description: 'a' * 50,
                            published: false,
                            author: current_author
                          ))
    @element = @post.elements.build
  end

  it 'renders the edit post form' do
    render

    assert_select 'form[action=?][method=?]', post_path(@post), 'post' do
      assert_select 'input[name=?]', 'post[title]'

      assert_select 'textarea[name=?]', 'post[description]'
    end
  end
end
