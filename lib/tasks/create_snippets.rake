namespace :create do
  
  desc 'Creates basic snippets for a Radiant Site.'
  task :snippets, :needs => :environment do

    if Snippet.find_by_name("head").nil?
      puts "creating new snippet: head"
      Snippet.new do |s|
        s.name = "head"
        s.content = 
          '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
          <html xmlns="http://www.w3.org/1999/xhtml">
          <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <!-- force IE8 to render as IE7 -->
          <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
          <title> | <r:page_title /></title>

          <meta name="keywords" content="" />
          <meta name="description" content="" />

          <!-- styles -->
          <link href="/stylesheets/reset.css" rel="stylesheet" type="text/css" media="screen" charset="utf-8" />
          <link href="/stylesheets/styles.css" rel="stylesheet" type="text/css" media="screen" charset="utf-8" />
          <!--[if IE]><link href="/stylesheets/ie7.css" rel="stylesheet" type="text/css" /><![endif]-->

          <!-- jquery -->
          <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js" type="text/javascript"></script>

          <!-- jQuery Tools: Tabs, Tooltip, Scrollable, Overlay, Expose. --> 
          <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>

          <!-- put all js normally inserted in <head> here to keep things neat -->
          <script src="/javascripts/swfobject.js" type="text/javascript" charset="utf-8"></script>
          <script src="/javascripts/base.js" type="text/javascript" charset="utf-8"></script>
          </head>'
      end.save
    else
      puts "existing snippet: head"
    end
    
    if Snippet.find_by_name("header").nil?
      puts "creating new snippet: header"
      Snippet.new do |s|
        s.name = "header"
        s.content = ''
      end.save
    else
      puts "existing snippet: header"
    end
    
    if Snippet.find_by_name("main-nav").nil?
      puts "creating new snippet: main-nav"
      Snippet.new do |s|
        s.name = "main-nav"
        s.content = 
          '<ul>
            <r:navigation urls="home: / | about: /about-us/ | faq: /faqs/ | contact: /contact">
              <r:normal><li class="<r:title />"><a href="<r:url />"><r:title /></a></li></r:normal>
              <r:here><li class="<r:title />"><a class="active" href="<r:url />"></a></li></r:here>
              <r:selected><li class="<r:title />" class="active"><a href="<r:url />"></a></li></r:selected>
            </r:navigation>
          </ul>'
      end.save
    else
      puts "existing snippet: main-nav"
    end
    
    if Snippet.find_by_name("footer").nil?
      puts "creating new snippet: footer"
      Snippet.new do |s|
        s.name = "footer"
        s.content = ''
      end.save
    else
      puts "existing snippet: footer"
    end
    
    if Snippet.find_by_name("sub-nav").nil?
      puts "creating new snippet: sub-nav"
      Snippet.new do |s|
        s.name = "sub-nav"
        s.content =
          '<r:if_parent>
            <r:parent>
              <r:snippet name="sub-nav" />
            </r:parent>
          </r:if_parent>
          <r:unless_parent>
            <ul>
            <r:children:each order="asc">
              <r:if_ancestor_or_self>
                <r:children:each order="asc">
                  <r:if_ancestor_or_self>
                    <li id="<r:slug/>"><r:link  class="active"/></li>
                    <r:if_children>
                      <ul class="tertiary">
                        <r:children:each order="asc">
                          <r:if_self>
                            <li id="<r:slug/>"><r:link class="active" /></li>
                          </r:if_self>
                          <r:unless_self>
                            <li id="<r:slug/>"><r:link /></li>
                          </r:unless_self>
                        </r:children:each>
                      </ul>
                    </r:if_children>
                  </r:if_ancestor_or_self>
                  <r:unless_ancestor_or_self>
                    <li id="<r:slug/>"><r:link /></li>
                  </r:unless_ancestor_or_self>
                </r:children:each>
              </r:if_ancestor_or_self>
            </r:children:each>
            </ul>
          </r:unless_parent>'
      end.save
    else
      puts "existing snippet: sub-nav"
    end
    
  end
end