require 'pact/consumer/rspec'

Pact.configure do | config |
  config.doc_generator = :markdown
end

Pact.service_consumer 'Cat Food App' do
  has_pact_with "Animal Service" do
    mock_service :animal_service do
      port 1234
      pact_specification_version "2.0.0"
    end
  end
end

