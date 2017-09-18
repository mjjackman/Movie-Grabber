class Film < ActiveRecord::Base

  validates :title, presence: true
  before_save :set_slug

  def self.slugify(to_slug)
    to_slug.gsub(" ", "_").downcase
  end 

  private

  def set_slug
    self.slug = slugify(self.title)
  end
end