67-272: Baking Factory Grading
===
Materials to help grade phase 5 of the Baking Factory project.  

Main Project
---
We need to replace the contents of their lib/tasks/ subdirectory with ours and well as replace the contents of their test/models subdirectory.

After doing that, we can build the project and run the ability model tests.  The .gitlab-ci-main.yml should be what we need here and since we are dropping our test files in then we don't need lines 18 & 20(commented out).  If it is easier to add our files to /home/sol, then add those lines back in and then comment out lines 13 & 15.

The TAs will run `rake db:populate` with the new populate task that was copied over when they run the project locally and it will generate results that match up with our grading process.


API Project
---
For the API repos, we need to replace their config/routes.rb with the one provided here, as well as replace the contents of their controller tests with the ones here in the test/controllers subdirectory. (We are only testing customers and orders controllers now.)

Frank and Stephanie tried their hand at the .gitlab-ci-api.yml but didn't fully test it.  Can you please review and make sure it is appropriate?  I did a quick skim and it looks reasonable, but I didn't test it.  They said they tried to set it up so "Justin just needs to copy our test folder into his /home/sol/test folder."  Thanks for reviewing this first.

_note: I did leave the original .gitlab-ci.yml file in the directory just in case it was helpful/needed._

