require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  def self.scrape_index_page(html)
    site = Nokogiri::HTML(open(html))
    
    students = []
    
    #student: "div.student-card"
    #name: student.css("a div.card-text-container h4").text
    #location: student.css("a div.card-text-container p").text
    #profile_url: student.css("a").attribute("href").value
    
    site.css("div.student-card").each do |profile| 
    student = {
      :name => profile.css("a div.card-text-container h4").text,
      :location => profile.css("a div.card-text-container p").text,
      :profile_url => profile.css("a").attribute("href").value
    }
    students << student
  end
  students
  end

  def self.scrape_profile_page
    site = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/students/ryan-johnson.html"))
    
    student = {}
    
    student[:profile_quote] = site.css("div.profile-quote").text
    student[:bio] = site.css("div.description-holder p").text
    
    site.css("div.social-icon-container").each do |sic|
      url = sic.css("")
      if url.include? "twitter"
        student[:twitter] = "test"
      end
    end #each loop
    
    binding.pry
  end

  scrape_profile_page
end

