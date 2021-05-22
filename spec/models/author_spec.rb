require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is database authenticable' do
    author = Author.create(
      email: 'test@example.com',
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(author.valid_password?('password123')).to be_truthy
  end
end
