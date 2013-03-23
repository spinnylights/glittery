require 'spec_helper'

describe Artist do
  before do
    @admin = Admin.create(username: "wishywashyfishes", password:
                       "fjJ#as0#4F")
  end

  let(:artist) { @admin.artist }

  subject { artist }

  it { should respond_to(:name) }
  it { should respond_to(:bio) }
  it { should respond_to(:email) }
  it { should respond_to(:photo_url) }
  it { should respond_to(:site_title) }

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
      it { should_not be_valid }
    end
  end
end
