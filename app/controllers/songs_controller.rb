class SongsController < ApplicationController

    def index
        songs = Song.all
        render json: {status: 200, songs: songs}
    end

    def show
        song = Song.find(params[:id])
        render json: {status: 200, song: song}
    end

    def create
        song = Song.new(song_params)

        if song.save
            render(status: 201, json: { song: song })
        else
            # Unprocessable Entity
            render(status: 422, json: { song: song })
        end
    end

    private # Any methods below here. Private methods are not exposed. Helper methods that do not correspond to routes also belong here.

    def song_params
        # Returns a sanitized hash of the params with nothing extra
        params.required(:song).permit(:title, :artist_name, :artwork)
    end
end