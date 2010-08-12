require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

SAMPLE_BLACKBERRY_USER_AGENT_STRING = "BlackBerry9630/4.7.1.40 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/105"

describe "SimpleUserAgent" do
  it "correctly detects an iphone user agent" do
    iphone = "Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341 Safari/528.16"
    SimpleUserAgent::is_iphone?(iphone).should == true
    SimpleUserAgent::is_ipad?(iphone).should == false
    SimpleUserAgent::is_blackberry?(iphone).should == false
    SimpleUserAgent::is_mobile?(iphone).should == true
    SimpleUserAgent::is_desktop?(iphone).should == false
  end
  
  it "correctly detects an ipad user agent" do
    ipad = "Mozilla/5.0 (iPad; U; CPU OS 3_2_1 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B367 Safari/531.21.10"
    SimpleUserAgent::is_ipad?(ipad).should == true
    SimpleUserAgent::is_iphone?(ipad).should == false
    SimpleUserAgent::is_blackberry?(ipad).should == false
    SimpleUserAgent::is_mobile?(ipad).should == true
    SimpleUserAgent::is_desktop?(ipad).should == false
  end

  it "correctly detects a blackberry user agent" do
    blackberry = "BlackBerry9630/4.7.1.40 Profile/MIDP-2.0 Configuration/CLDC-1.1 VendorID/105"
    SimpleUserAgent::is_blackberry?(blackberry).should == true
    SimpleUserAgent::is_iphone?(blackberry).should == false
    SimpleUserAgent::is_ipad?(blackberry).should == false
    SimpleUserAgent::is_mobile?(blackberry).should == true
    SimpleUserAgent::is_desktop?(blackberry).should == false
  end

  it "correctly detects chrome user agent" do
    chrome = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.0.249.30 Safari/532.5"
    SimpleUserAgent::is_desktop?(chrome).should == true
    SimpleUserAgent::is_mobile?(chrome).should == false
    SimpleUserAgent::browser(chrome).should == 'chrome'
  end

  it "correctly detects firefox 3.5 user agent" do
    firefox_3_5 = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 "
    SimpleUserAgent::is_desktop?(firefox_3_5).should == true
    SimpleUserAgent::is_mobile?(firefox_3_5).should == false
    SimpleUserAgent::browser(firefox_3_5).should == 'firefox'
  end

  it "correctly detects safari 4 user agent" do
    safari_4 = "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9"
    SimpleUserAgent::is_desktop?(safari_4).should == true
    SimpleUserAgent::is_mobile?(safari_4).should == false
    SimpleUserAgent::browser(safari_4).should == 'safari'
  end

  it "correctly detects ie 6 user agent" do
    ie6 = "Mozilla/5.0 (Windows; U; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
    SimpleUserAgent::is_desktop?(ie6).should == true
    SimpleUserAgent::is_mobile?(ie6).should == false
    SimpleUserAgent::browser(ie6).should == 'ie6'
  end

  it "correctly detects ie 7 user agent" do
    ie7 = "Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; el-GR)"
    SimpleUserAgent::is_desktop?(ie7).should == true
    SimpleUserAgent::is_mobile?(ie7).should == false
    SimpleUserAgent::browser(ie7).should == 'ie7'
  end

  it "correctly detects ie 8 user agent" do
    ie8 = "Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3)"
    SimpleUserAgent::is_desktop?(ie8).should == true
    SimpleUserAgent::is_mobile?(ie8).should == false
    SimpleUserAgent::browser(ie8).should == 'ie8'
  end

end
