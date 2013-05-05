require 'spec_helper'
require 'builder'

describe Radiodan::Builder do
  before :each do
    @player = mock
    Radiodan::Player.stub(:new).and_return(@player)
  end

  it 'passes a playlist to the player' do
    playlist = mock

    @player.should_receive(:playlist=).with(playlist)

    builder = Radiodan::Builder.new do |b|
      b.playlist playlist
    end
  end

  it 'passes an instance of an adapter class with options to the player' do
    class Radiodan::MockAdapter; end
    adapter, options = mock, mock

    Radiodan::MockAdapter.should_receive(:new).with(options).and_return(adapter)

    @player.should_receive(:adapter=).with(adapter)

    builder = Radiodan::Builder.new do |b|
      b.adapter :mock_adapter, options
    end
  end
end
