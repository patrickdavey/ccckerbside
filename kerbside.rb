require 'rubygems'
require 'mechanize'

class Kerbside
  def initialize
    @mechanize = Mechanize.new { |agent|
      agent.user_agent_alias = 'Mac Safari'
    }
  end

  def search(street_number,street_name)
    @mechanize.get('http://kerbside.ccc.govt.nz/index.aspx') do |page|
      search_result = page.form_with(:name => 'form1') do |kerb_form|
        kerb_form.txtStreetNoFrom = street_number
        kerb_form.txtStreetName = street_name
      end.click_button
      final_result = search_result.form_with(:name => 'form1') do |f|
        f.__EVENTTARGET = 'grdAddress$ctl02$lnkbtnAddress'
      end.submit
      next_recycling = final_result.parser.xpath("//table[@id='tblRecycling']/tr[4]/td[2]").inner_text
      next_rubbish = final_result.parser.xpath("//table[@id='tblRubbish']/tr[4]/td[2]").inner_text
      #return an array sorted by date
      return {
        :recycling => Date.strptime(next_recycling, '%d %b %Y'),
        :rubbish => Date.strptime(next_rubbish, '%d %b %Y')
      }.sort{|a,b| a[1]<=>b[1]}
    end
  end
end
