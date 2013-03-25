require 'spec_helper'

describe Artwork do
  before do
    @admin = Admin.create(username: 'wishywashy',
                          password: 'df#4jF9d',
                          password_confirmation: 'df#4jF9d')
  end
  
  let(:artwork) { generate_artwork_for_admin(@admin) }

  subject { artwork }

  it { should respond_to :description }
  it { should respond_to :name }
  it { should respond_to :image }

  describe 'Artist association' do
    it 'should have an associated artist' do
      artwork.artist.class.should == Artist
    end
  end

  describe 'validations' do
    context 'without an attached image' do
      let(:invalid_artwork) do
        Artwork.new(name: 'Whiasakas', description: 'Polar ice.')
      end

      specify { invalid_artwork.should_not be_valid }
    end
  end
end
