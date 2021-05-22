class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged history finders]

  is_impressionable

  belongs_to :author
  has_many :elements

  has_one_attached :header_image

  validates_presence_of :title, :description
  validates_length_of :description, within: 50..250

  scope :published, lambda {
    where(published: true)
  }

  scope :most_recently_published, lambda {
    order(published_at: :desc)
  }

  def should_generate_new_friendly_id?
    title_changed?
  end
end
