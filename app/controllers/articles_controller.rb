class ArticlesController < ApplicationController
  def new 
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(:title => params['title'], :body => params['body'])
    if @article.save
      redirect_to article_path(@article.id)
    else
      render :new
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(:title => params['title'], :body => params['body'])
      redirect_to article_path(@article.id)
    else
      render :update
    end
  end
end
