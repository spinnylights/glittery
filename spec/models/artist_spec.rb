require 'spec_helper'

describe Artist do
  before do
    @admin = Admin.create(username: "wishywashyfishes", 
                          password: "fjJ#as0#4F",
                          password_confirmation: "fjJ#as0#4F")
  end

  let(:artist) { @admin.artist }

  subject { artist }

  it { should respond_to(:name) }
  it { should respond_to(:bio) }
  it { should respond_to(:email) }
  it { should respond_to(:photo) }
  it { should respond_to(:site_title) }

  it 'should have a Paperclip attachment' do
    artist.photo.url.class.should == String
  end

  describe 'attr defaults' do
    subject { artist }

    its(:name) { artist.name.class.should == String }
    its(:bio) { artist.bio.class.should == String }
    its(:site_title) { artist.site_title.class.should == String }
  end

  describe 'Admin associations' do
    specify { artist.should respond_to(:admin) } 

    context 'without an admin_id' do
      let(:wrong_artist) { Artist.new }
      specify { wrong_artist.should_not be_valid }
    end
  end

  describe 'Artwork associations', wip: true do
    let(:artwork) do 
      artist.artworks.new(name: artwork_name, 
                          description: artwork_description)
    end

    specify { artist.should respond_to(:artworks) }

    describe 'dependent artwork destruction' do
      before do
        generate_artwork_for_admin(@admin)
      end

      specify 'destroying the artist should destroy its artwork' do
        artist.destroy

        Artwork.find_by_name(artwork_name).should be_nil
      end
    end
  end
end
