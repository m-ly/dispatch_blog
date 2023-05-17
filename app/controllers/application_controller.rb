class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    name = params[:name]
    
    @storage = DatabasePersistence.new
    selection = @storage.show_posts
    render 'application/index', locals: { selection: selection }
  end
end


class DatabasePersistence 

  def initialize()
    @db = PG.connect(dbname: 'dispatch_blog')   
    #@logger = logger
  end

  # def query(statement, *params)
  #   @logger.info("#{statement}: #{params}")
  #   @db.exec_params(statement, params)
  # end

  def show_posts
    sql = "SELECT * FROM posts;"
    @db.exec(sql).map do |tuple|
      {title:  tuple['title'], 
       body: tuple['body'], 
       author: tuple['author'], 
       created_at: tuple['created_at']
      }
    end
  end 
end 