15.21

Git Clone
bundle 
bundle exec rspec
bundle exec rails s

stage 1
Create something which will find the test panel and build the json

Stage 2
handle the include param

additional stage 1 note:

Sample tube type(s) and Total sample volume must be calculated and tested
Create AR type methods to find the test from the ID

15:33
create the find_by on Test model and spec
find_by returns a hash, it could return an object - will kick the decsion down the road

Creating the same method on the test_panel class - create a concern or super class? also kicking this down the road

15:40
Copy the find_by from Test model and paste into test_panel
Add spec

Thinking about how to write the Sample tube type(s) and Total sample volume methods and now it would be better to have the test_panel object
Will make find_by methods return an object

15:48
methods and tests updated

will add methods on test_panel to calculate the sample_tube_types and total_sample_volume


Note: We have Total sample volume requirement (calculated from associated tests)  in the text but sample_volume_requirement is the json
 I will go with sample_volume_requirement

16:04
Methods and specs written

Thinking about how to create the serializer. ActiveRecord::Serializer could work, but the json is so different I don't think
it'll be worth it

I will start on the controller and see what interface I want/need.
If id is invalid return a 404. Make the find_by method in test_panel convert the id to upper case

16:30
sigh...
created the serializer folder and serializer for the test_panel. Firstly the serializer folder was not autloaded, googled and added a line in the 
 application.rb to autoload the files in /serializers

added include ActiveModel::Serialization to the test_panel class

The controller looks like this:
```
class TestPanelsController < ApplicationController

  def show
    test_panel = TestPanel.find_by(params[:id])
    if test_panel
      render json: TestPanelSerializer.new(test_panel) and return
    end

    render json: { error: 'invalid code' }, code: 404
  end
end

```

I will write the specs and build the serializer and fingers crossed, the app should just work

17:00

Specs pass; serializer produces the expected json and json is displayed in the browser.
added .as_json to the TestPanelSerializer.new(test_panel) code in the serializer

Now to do the include part.
At this stage, I'm pretty bored and I'm not sure adding :include in the json will show anything new.

I think I will add a spec for the controller and call it a day.

17:07
Controller spec passes


Additional notes:

I worked pretty much at a consistent pace without much interuptions.
If this was for production, I would add more specs and revisit the things I kicked down the road. 
I had to google a few things.

