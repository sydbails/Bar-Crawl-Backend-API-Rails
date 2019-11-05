class CrawlsController < ApplicationController
    # before_action :authenticate_user!

    def new
        crawl = Crawl.new
    end

    def index
        crawls = Crawl.all
        render json: crawls.to_json(:include => {
            :crawlers => {:except => [:user_id, :crawl_id, :created_at, :updated_at],
            :include => {
                :user => {:except => [:updated_at, :created_at]}
            }}
        })
    end

    def show
        crawl = Crawl.find_by(id: params[:id])
        render json: crawl.to_json(:include => {
            :user => {:except => [:created_at, :updated_at]}}, :include => {
            :crawlers => {:except => [:user_id, :crawl_id, :created_at, :updated_at],
            :include => {
                :user => {:except => [:updated_at, :created_at]}
            }}
        })
    end

    def create
        crawl = Crawl.create(crawl_params)
        render json: {status: 'Crawl successfully created'}
    end

    def edit
        crawl = Crawl.find_by(id: params[:id])
    end

    def update
        crawl = Crawl.find_by(id: params[:id])
        crawl.update
    end

    def destroy
        crawl = Crawl.find_by(id: params[:id])
        crawl.destroy
    end

    private
    def crawl_params
        params.require(:crawl).permit(:user_id, :location_1, :location_2, :location_3)
    end
end
