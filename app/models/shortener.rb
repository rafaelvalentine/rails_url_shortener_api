class Shortener < ApplicationRecord
  validates :url, presence: true
  VALID_SHORTCODE_REGEX = /\A[^\W][0-9a-zA-Z\-_]{4,}+\z/i
  validates :shortcode, presence: true, length: { minimum: 4 }, format: { with: VALID_SHORTCODE_REGEX }, uniqueness: { case_sensitive: false }, allow_blank: true

  def self.generate_shortcode
    SecureRandom.alphanumeric(6)
  end

  def self.total_count
    where(is_active: true, is_deleted: false).count
  end

  def self.total_clicks
    total_clicks = 0
    find_each do |clicked|
      total_clicks += clicked.access_count.try(:to_i)
    end
    total_clicks
  end
end
