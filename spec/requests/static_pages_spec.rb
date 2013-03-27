require 'spec_helper'

describe "StaticPages" do
  
  subject {page}
  
  shared_examples_for "all static pages" do 
    it { should have_selector('h1', :text => heading) } 
  end
  
  describe "Home Page" do
    before { visit root_path }
    it_should_behave_like "all static pages"
    it { should have_selector 'title', :text => 'FindAHouseForMe | Home' }
  end

  describe "About Page" do
    before { visit root_path }
    it_should_behave_like "all static pages"
    it { should have_selector 'title', :text => 'FindAHouseForMe | About' }
  end 
   
  describe "Contact Page" do
    before { visit root_path }
    it_should_behave_like "all static pages"
    it { should have_selector 'title', :text => 'FindAHouseForMe | Contact' }
  end

  describe "Help Page" do
    before { visit root_path }
    it_should_behave_like "all static pages"
    it { should have_selector 'title', :text => 'FindAHouseForMe | Help' }
  end 
end
