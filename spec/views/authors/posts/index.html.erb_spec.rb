require 'rails_helper'

RSpec.describe 'authors/posts/index', type: :view do
  # TODO: extract this into a fixture or test helper file
  current_author = Author.first_or_create!(email: 'test@test.com', password: 'password',
                                           password_confirmation: 'password')

  before(:each) do
    assign(:posts, [
             Post.create!(
               title: 'Title',
               description: 'a' * 50,
               published: false,
               author: current_author
             ),
             Post.create!(
               title: 'Title',
               description: 'a' * 50,
               published: false,
               author: current_author
             ),
             Post.create!(
               title: 'Title',
               description: 'a' * 50,
               published: true,
               author: current_author
             )
           ])
  end

  it 'renders a list of posts' do
    render
    assert_select 'h5.card-title', text: 'Title'.to_s, count: 3
    assert_select 'span.badge-secondary', text: 'Unpublished'.to_s, count: 2
    assert_select 'span.badge-primary', text: 'Published'.to_s, count: 1
    assert_select 'p.text-secondary', text: ('a' * 50).to_s, count: 3
  end
end
