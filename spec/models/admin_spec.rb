require 'spec_helper'

describe Admin do
  before do
    @admin =  Admin.new(username: 'whistley', password: 'g4tTer!no')
  end

  it { should respond_to(:username) }
  it { should respond_to(:password) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      @admin.should be_valid
    end

    describe 'for :username' do
      it 'is not valid without a username' do
        @admin.username = nil
        @admin.should_not be_valid
      end

      it 'is not valid with a username under six characters' do
        @admin.username = 'a' * 5
        @admin.should_not be_valid
      end
      
      it 'is not valid with a username that is only whitespace' do
        @admin.username = " " * 6
        @admin.should_not be_valid
      end
    end

    describe 'for :password' do
      it 'is not valid without a password' do
        @admin.password = nil
        @admin.should_not be_valid
      end

      it 'is not valid with a password with only lowercase letters' do
        @admin.password = 'g4tter!no'
        @admin.should_not be_valid
      end

      it 'is not valid with a password with only uppercase letters' do
        @admin.password = 'G4TTER!NO'
        @admin.should_not be_valid
      end

      it 'is not valid with a password without a number' do
        @admin.password = 'gatTer!no'
        @admin.should_not be_valid
      end

      it 'is not valid with a password without a symbol (@#$!)' do
        @admin.password = 'g4tTerino'
        @admin.should_not be_valid
      end

      it 'is not valid with a password with forbidden characters' do
        @admin.password = '^&*^&aA3%*'
        @admin.should_not be_valid
      end

      it 'is not valid with a password under eight characters' do
        @admin.password = 'a' * 7
        @admin.should_not be_valid
      end
    end

    context 'when username is already taken', wip: true do
      let(:admin_dup) do
        Admin.new(username: @admin.username, password: @admin.password)
      end

      before { @admin.save}

      specify { admin_dup.should_not be_valid }
    end
  end

  describe 'authentication' do 
    before { @admin.save }

    it { should respond_to(:password_digest) }
    it { should respond_to(:remember_token) }

    let(:admin_found_copy) { Admin.find_by_username(@admin.username) }

    specify { @admin.should respond_to(:authenticate) }

    context 'with valid password' do
      specify 'authenticate should return self' do
        @admin.should == admin_found_copy.authenticate(@admin.password)
      end
    end

    context 'with invalid password' do
      let(:invalid_password_admin) do 
        admin_found_copy.authenticate("uggsbuggs")
      end 

      specify 'authenticate should return false' do
        @admin.should_not == invalid_password_admin
        invalid_password_admin.should be_false
      end
    end
  end

  describe 'cookie setup' do
    before  { @admin.save }
    specify { @admin.remember_token.should_not be_blank }
  end
  
  describe 'Artist associations' do
    before { @admin.save }

    specify { @admin.should respond_to(:artist) }

    it 'should create an artist on save' do 
      @admin.artist.class.should == Artist
    end

    specify 'its artist should be associated with it' do 
      @admin.should == @admin.artist.admin
    end

    describe 'artist attr setting through admin' do
      before do 
        @artist = @admin.artist
        @artist.name = 'Fanny Wanny'
        @artist.save
      end 

      it 'should allow setting artist attrs' do 
        @admin.artist.name.should == 'Fanny Wanny'
      end
    end
  end

  describe 'external_config_admin class method' do
    let(:external_admin) do
      file = Psych.load(File.open('config/admin.yml'))
      Admin.new(username: file[:username], password: file[:password])
    end

    it 'should return the admin specified in config/admin.yml' do
      Admin.external_config_admin.username.should == external_admin.username
    end 

    it 'should generate the yml admin if it does not exist' do
      Admin.external_config_admin.destroy
      Admin.external_config_admin.username.should == external_admin.username
    end

    it 'should have an associated artist' do
      Admin.external_config_admin.artist.should be_true
    end
  end
end
