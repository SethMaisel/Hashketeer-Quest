Hashketeer Quest

Installation Requirement: 

In order to run the application you will need the following Ruby gems: activerecord, sqlite3, sinatra, sinatra-activerecord, require_all, pry, tty-prompt, and rainbow.

There are 2 different ways you can ensure the gems are on your computer for the application. One way is to run the bundle install in your terminal once the repo has been downloaded. The other way is to do a gem install for each of the gems. 

The application also runs off of a database. To ensure the database is set up, run rake db:migrate and then rake db:seed. 

Once the gems and the database has been set up, you are ready to run the application. To do this type in ruby runner.rb from the root directory. 
To avoid the gem warning message, type in ruby -W0 runner.rb.

About this program:

We are new to coding and this is our first attempt at a fully functional and interactive CLI app. Please manage your expectations.

This is a fantasy RPG called "Hashketeer Quest". You have the option to choose one of three characters, each with their own strengths, weaknesses, gear, and backstory.

You can name your character and will be launched into a battle with a hideous monster.  The battle mechanic features a virtual dice roll which will determine your damage to your opponent and the damage they do to your health.  

When your opponent health drops below 0, you win!  You will be prompted to input your victory cry and see your character's happy ending.

Should you be defeated, you will be asked to input your last words and see the tale of your death.


Finally, if defeat seems unavoidable, you can also run away.
You will be insulted.

After the game ends, you will have the option to start over.

