namespace :create do
  
  desc 'Creates basic layouts for a Radiant Site.'
  task :layouts, :needs => :environment do

    if Layout.find_by_name("home-layout").nil?
      puts "creating new layout: home-layout"
      Layout.new do |s|
        s.name = "home-layout"
        s.content = 
'<r:snippet name="head" />
 <body>

  <div id="wrapper">
    <r:snippet name="main-nav" />
    <r:content />
    <r:snippet name="footer" />
  </div>

</body>
</html>'
      end.save
    else
      puts "existing layout: home-layout"
    end
    
    if Layout.find_by_name("interior-layout").nil?
      puts "creating new layout: interior-layout"
      Layout.new do |s|
        s.name = "interior-layout"
        s.content = 
'<r:snippet name="head" />
<body>

  <div id="wrapper">
    <r:snippet name="main-nav" />
    <r:content />
    <r:snippet name="footer" />
  </div>

</body>
</html>'
      end.save
    else
      puts "existing layout: interior-layout"
    end
    
  end
end