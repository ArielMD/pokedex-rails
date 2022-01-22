class Api::PokedexController < Api::ApiController
  def create
    PokedexService.new.generate_kalos_pokemon
    render json: { message: 'Request Accepted' }, status: :accepted
  end
end
