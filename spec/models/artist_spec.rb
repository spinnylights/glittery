require 'spec_helper'

describe Artist do
  before do
    admin = Admin.create(username: "wishywashyfishes", password:
                       "fjJ#as0#4F")
    @artist = admin.artist
  end

  describe 'Admin associations' do
    specify { @artist.should respond_to(:admin) } 

    context 'without an admin_id' do
      let(:wrong_artist) { Artist.new }
      it { should_not be_valid }
    end
  end
end
