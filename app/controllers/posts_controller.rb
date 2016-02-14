class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @post = Post.create({text: params[:text], user_id: current_user.id, emotion_id: params[:emotion][:emotion_id]})

    flash[:success] = "Post Created"
    redirect_to "/users/#{current_user.id}"
  end

  def show
    @post = Post.find(params[:id])

    if params[:excited]
      if @post.emotion_id == 1
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 1, match: 1)

        # Begin Weef check
        weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            Weef.create(weaction_A_id: @post.user_id, weaction_B_id: current_user.id)
          end
        end
        # End Weef check

      else
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 1)
      end

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:amused]
      if @post.emotion_id == 2
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 2, match: 1)

        # Begin Weef check
        weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            Weef.create(weaction_A_id: @post.user_id, weaction_B_id: current_user.id)
          end
        end
        # End Weef check

      else
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 2)
      end

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:sympathetic]
      if @post.emotion_id == 3
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 3, match: 1)

        # Begin Weef check
        weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            Weef.create(weaction_A_id: @post.user_id, weaction_B_id: current_user.id)
          end
        end
        # End Weef check

      else
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 3)
      end

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end

    if params[:annoyed]
      if @post.emotion_id == 4
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 4, match: 1)

        # Begin Weef check
        weactions = Weaction.where(user_id: @post.user_id).where(match: true)
        weactions.each do |weaction|
          if weaction.post.user_id == current_user.id
            flash[:success] = "You Weef'd!"
            Weef.create(weaction_A_id: @post.user_id, weaction_B_id: current_user.id)
          end
        end
        # End Weef check

      else
        Weaction.create(user_id: current_user.id, post_id: @post.id, emotion_id: 4)
      end

      post = Post.all.sample
      redirect_to "/posts/#{post.id}"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update({text: params[:text], emotion_id: params[:emotion][:emotion_id]})

    flash[:success] = "Post Updated"
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end  
end
