class ArticlesController < ApplicationController
  def new 
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
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
    if @article.update(article_params)
      redirect_to article_path(@article.id)
    else
      render :update
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    end
  end

  private

  def article_params
    params.permit(:title, :body)
  end
end
