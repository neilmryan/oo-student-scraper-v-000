require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
        
    #the page itself = doc = Nokogiri::HTML(open(index_url))
    #the collection of students = doc.css(".student-card")
    #you must assign the project element to a working variable, in this case "student" using student =_
    #the name of an individual student = student.css("h4.student-name").text
    #the location of an individual student = student.css("p.student-location").text
    #the profile_url of an individual student = student.css("a").attribute("href").value
    
    #to return an array of hashes each hash representing an individual student
    students = []
    
    doc.css(".student-card").each do |student|
      student_hash = {
        :name => student.css("h4.student-name").text,
        :location => student.css("p.student-location").text,
        :profile_url => student.css("a").attribute("href").value
      }
      students << student_hash
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

