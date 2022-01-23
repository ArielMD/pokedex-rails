require 'rails_helper'

RSpec.describe GeneratePokemonJob, type: :job do
  describe '#perform_later' do
    it 'generate pokemon through an external API' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        GeneratePokemonJob.perform_later
      end.to have_enqueued_job
    end
  end
end
