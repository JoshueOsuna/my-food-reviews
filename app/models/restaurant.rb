# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string           not null
#
class Restaurant < ApplicationRecord
  before_validation :slugify

  validates :name, :slug, presence: true
  validates :name, :slug, uniqueness: true

  has_many :reviews, dependent: :destroy

  def slugify
    self.slug = name.parameterize
  end

  def average_score
    return 0 unless reviews.count.positive?

    reviews.average(:score).round(2).to_f
  end
end
