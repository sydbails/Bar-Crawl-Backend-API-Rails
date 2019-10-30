class Crawler < ApplicationRecord
    belongs_to :user
    belongs_to :crawl 
end
