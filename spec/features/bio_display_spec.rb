require 'spec_helper'

describe "bio display" do
  let(:artist) { Admin.external_config_admin.artist }

  context "with no bio information" do
    it "should not display a bio link" do
      visit '/'
      page.should_not have_link 'bio'
    end
  end

  context "with bio information" do
    before do
      populate_artist_info(artist)
    end

    it "should not display a contact link without an email" do
      artist.email = nil
      artist.save

      visit '/'
      click_link 'bio'
      page.should_not have_link 'contact'
    end

    it "should not display a missing photo" do
      artist.photo = nil
      artist.save

      visit '/'
      click_link 'bio'      
      page.should_not have_selector './/div[@id="artist_info"]//img'
    end 

    it "should not display a missing name" do
      artist.name = nil
      artist.save

      visit '/'
      click_link 'bio'
      page.should_not have_selector './/div[@id="artist_info"]//h2[@id=name]'
    end
  end
end
