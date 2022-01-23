class Api::PokedexController < Api::ApiController
  def create
    GeneratePokemonJob.perform_later
    render json: { message: 'Request Accepted' }, status: :accepted
  end
end
