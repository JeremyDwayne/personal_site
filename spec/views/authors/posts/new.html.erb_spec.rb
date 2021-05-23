require 'rails_helper'

RSpec.describe 'authors/posts/new', type: :view do
  # TODO: extract this into a fixture or test helper file
  current_author = Author.first_or_create!(email: 'test@test.com', password: 'password',
                                           password_confirmation: 'password')
  before(:each) do
    assign(:post, Post.new(
                    title: 'MyString',
                    description: 'a' * 50,
                    published: false,
                    author: current_author
                  ))
  end

  it 'renders new post form' do
    render

    assert_select 'form[action=?][method=?]', posts_path, 'post' do
      assert_select 'input[name=?]', 'post[title]'
      assert_select 'textarea[name=?]', 'post[description]'
      assert_select 'input[name=?]', 'post[header_image]'
    end
  end
end
