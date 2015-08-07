require 'spec_helper'

describe "OmniAuth::Strategies::Sign2pay" do
  subject do
    OmniAuth::Strategies::Sign2pay.new({})
  end

  context 'client options' do
    it 'has the correct name' do
      expect(subject.options.name).to eq('sign2pay')
    end

    it 'has correct OAuth endpoint' do
      expect(subject.options.client_options.site).to eq('https://app.sign2pay.com/')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('https://app.sign2pay.com/oauth/authorize')
    end
  end

  # context 'uid' do
  #   before :each do
  #
  #     allow(subject).to receive_messages(:raw_info => @raw_info)
  #   end
  #
  #   it 'returns the correct id from raw_info' do
  #     expect(subject.uid).to eq(123)
  #   end
  # end


end
