class LikesController < ApplicationController
#   before_action :find_artwork
    def create
      # byebug
        # art_id = params[:id]
        # Like.create(artwork_id: art_id, user: @current_user)
        # redirect_to artwork_path(art_id)
        # @artwork = Request[@artwork]
        Like.create(user_id: @current_user.id, artwork_id: @artwork.id)
        redirect_to artwork_path(@artwork.id)
    end

    private

    def find_artwork
      @artwork = Artwork.find(params[:artwork])
    end

    def like_params
        params.require(:like).permit(:user_id, :artwork_id)
    end
end
