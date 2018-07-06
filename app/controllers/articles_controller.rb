class ArticlesController < ApplicationController

    protect_from_forgery except: :index
    http_basic_authenticate_with name: "dhh", 
    password: "secret", except: [:index, :show]

    def index
        # @articles = Article.all
        @articles = Article.order(:title).page(params[:page])
        @articles_json = @articles.to_json
        respond_to do |format|
            format.html
            format.js
            format.json { render json: @articles }
        end  
    end

    def show
        # @article = Article.find(params[:id])
        @article = Article.find_by_slug(params[:slug])
    end
    
    def new
        @article = Article.new
    end

    def edit
        # @article = Article.find(params[:id])
        @article = Article.find_by_slug(params[:slug])
    end

    def create
        @article = Article.new(article_params)
       
        respond_to do |format|
            if @article.save
              format.html { redirect_to @article, notice: 'Article was successfully created.' }
              format.json { render json: @article, status: :created, location: @article }
            else
              format.html { render action: "new" }
              format.js
              format.json { render json: @article.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        # @article = Article.find(params[:id])
        @article = Article.find_by_slug(params[:slug])
 
        
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end      
    end


    def destroy
        # @article = Article.find(params[:id])
        @article = Article.find_by_slug(params[:slug])
        @article.destroy
   
        redirect_to articles_path
    end

    private
        def article_params
            params.require(:article).permit(:title, :text, :slug)
        end
end
