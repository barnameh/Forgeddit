class Link < ApplicationRecord
  belongs_to  :user
  has_many    :comments

  validates :url, presence: true

  def url
    if self[:url].downcase.start_with?("http")
      self[:url]
    else
      "http://" + self[:url]
    end
  end

  def url=(in_url)
    if in_url.downcase.start_with?("http")
      self[:url] = in_url
    else
      self[:url] = "http://" + in_url
    end
  end
end
