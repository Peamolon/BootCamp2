class PostsController < ApplicationController
    #Get /posts
    before_action :authenticate_user!
    def index
        @posts = Post.all
    end
    #Get /posts/id
    def show
        @post = Post.find(params[:id])
       ActionCable.server.broadcast('notification_channel', 'You have visited the welcome page.')
    end
    
    def new
        @post = Post.new
    end
    
    def create
        d = Date.new(params[:post]["expire(1i)"].to_i,  params[:post]["expire(2i)"].to_i,  params[:post]["expire(3i)"].to_i)
        @post = Post.new(content: params[:post][:content], 
                         seen: params[:post][:seen], 
                         expire: d)
         @post.owner_id = current_user.id

        
       if @post.seen == '0'
            @post.seen = 'No visto'
       else
           @post.seen = 'Visto'
       end
            
        if @post.save
            redirect_to @post
        else
           render :new
        end
        
        
    
    end
    
    
    def update
         d = Date.new(params[:post]["expire(1i)"].to_i,  params[:post]["expire(2i)"].to_i,  params[:post]["expire(3i)"].to_i)
         seens = ''
        if params[:post][:seen] == '0'
            seens = 'No visto'
        else
           seens = 'Visto'
        end
        @post = Post.find(params[:id])
        if @post.update(content: params[:post][:content], 
                         seen: seens, 
                         expire: d) 
            redirect_to @post
        else
            redirect_to :edit
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def list_by_seen
        @posts = Post.all
        @posts_filter = Post.where("seen = ?", "No visto")
    
    end
    
    private
    
    def post_params
        params.require(:post).permit(:content,:seen, :expire)
    end

end 