class CrawlersController < ApplicationController
    def new
    end

    def create
        crawler = Crawler.create(crawler_params)
        render json: {status: 'new crawler has been added!'}
    end

    def index
        crawlers = Crawler.all
        render json: crawlers
    end

    def show
        crawler = Crawler.find_by(id: params[:id])
    end

    def index
    end
    
    private
    def crawler_params
        params.require(:crawler).permit(:user_id, :crawl_id)
    end


end
