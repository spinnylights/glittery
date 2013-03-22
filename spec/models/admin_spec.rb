require 'spec_helper'

describe Admin do
  before(:each) do
    @admin =  Admin.new(username: 'whistley', password: 'g4tTer!no')
  end

  it { should respond_to(:username) }
  it { should respond_to(:password) }

  it 'should generate a password digest at initialization' do
   @admin.should respond_to(:password_digest)
  end

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
  end

  describe 'authentication' do 
    before do 
      @admin.save 
    end
    
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
end
