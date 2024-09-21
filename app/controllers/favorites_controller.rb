class FavoritesController < ApplicationController

    def create
      @blog = Blog.find(params[:blog_id])
      current_user.favorites.create(blog_id: @blog.id)
      respond_to do |format|
        format.html { redirect_to blogs_path}
        format.js
    end
  end

    def destroy
      favorite = current_user.favorites.find_by(id: params[:id])
      @blog_id = favorite.blog_id
      favorite.destroy
      
      respond_to do |format|
        format.html { redirect_to blogs_path}
        format.js
    end
  end
end
