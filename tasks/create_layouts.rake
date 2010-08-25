namespace :create do
  
  desc 'Creates basic snippets for a Radiant Site.'
  task :layouts, :needs => :environment do

    if !Layout.find_by_name("home-layout").nil?
      Layout.new do |s|
        s.name = "home-layout"
        s.content = '
          <r:snippet name="head" />
          <body>

            <div id="wrapper">
              <r:snippet name="header" />
              <!-- content html goes here -->
              <r:snippet name="footer" />
            </div>

          </body>
          </html>'
      end.save
    end
    if !Layout.find_by_name("interior-layout").nil?
      Layout.new do |s|
        s.name = "interior-layout"
        s.content = '
          <r:snippet name="head" />
          <body>

            <div id="wrapper">
              <r:snippet name="header" />
              <!-- content html goes here -->
              <r:snippet name="footer" />
            </div>

          </body>
          </html>'
      end.save
    end
    
  end
end