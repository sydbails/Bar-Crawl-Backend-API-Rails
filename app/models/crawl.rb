class Crawl < ApplicationRecord
    belongs_to :user
    has_many :crawlers
end
