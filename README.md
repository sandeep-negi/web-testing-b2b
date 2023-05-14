# Keyword driven web framework

### Available Keywords

| keyword                         | description                                                                                               |
|:--------------------------------|:----------------------------------------------------------------------------------------------------------|
| open                            | open url in the browser                                                                                   |
| type                            | enter text in text field                                                                                  |
| click                           | click on element                                                                                          |
| text                            | retrieve text of any element                                                                              |
| exists                          | verify if an element is present                                                                           |
| waitForElement                  | wait for element to be present for specified timeout duration (default: 10 seconds)                       |
| waitForText                     | wait for provided text to be present in the element                                                       |
| waitForNoElement                | wait for element to be not present                                                                        |
| clear                           | clear text field                                                                                          |
| fireClickEvent                  | click an element via java-script                                                                          |
| waitWhilePresent                | wait while element is present on the screen                                                               |
| screenshot                      | take screenshot of the current screen                                                                     |
| switchIFrame                    | switch iframe using provided locator                                                                      |
| switchToDefaultContent          | switch to default browser content                                                                         |
| waitForUrlToContain             | wait for browser current url to contain provided text/value                                               |
| verifyText                      | verify provided text is present on the provided field/screen                                              |
| waitForTextToContain            | wait for screen/element to contain provided substring. we can also use reg-ex here.                       |
| clickByAction                   | click an element using action class in java                                                               |
| sleep                           | hault execution for specified time (in seconds)                                                           |
| select                          | select a value in a drop down                                                                             |
| waitForElementVisible           | waits for element to be visible on screen                                                                 |
| getAttribute                    | gets attribute for specified element and store it in var                                                  |
| waitForElementClickable         | waits for element to be clickable                                                                         |
| alertText                       | get javascript alert text                                                                                 |
| alertAccept                     | accept javascript alert                                                                                   |
| waitForSpinner                  | waits for page to load completely(spinner icon to disappear)                                              |
| elementSelectionStateToBe       | waits for selected state of the element to be 'true' or 'false'.                                          |
| waitForAnyoneElementToBeVisible | waits for either of the element to be visible                                                             |
| switchToNewWindow               | opens a new window/tab, switches driver focus to it and returns window handle for previous driver session |
| switchToWindow                  | switches driver focus to the given window handle and returns window handle for previous driver session    |
| deleteAllCookies                | deletes all cookies until none are left                                                                   |

### Rest Actions

To send a rest api call, you can use below json and pass it as a doc string in cucumber steps:

```
    {
	"url": "",
	"path": "",
	"method": "POST/GET/PUT/DELETE/PATCH",	
	"query_params": {
	                    "key": "value"
	                },
	"path_params": {
	                    "key": "value"
	               },
        "form_params": {
	                    "key": "value"
	               },	                                
	"body": "{}",
	"content_type": "",
	"session_id": true,
	"jwt_authorization": true,
	"csrf_token": true
}
```

```
    url                 #=> default value will be test env url.
    path                #=> end point of api
    method              #=> rest call method
    query_params        #=> query parameters (if any) as key value pair
    form_params         #=> form parameters (if any) as key value pair
    path_params         #=> path parameters (if any) as key value pair
    body                #=> request body
    content_type        #=> default: application/json
    session_id          #=> true or false depending if it needs to be captured. (default: true)
    jwt_authorization   #=> true or false depending if it needs to be captured. (default: false)
    csrf_token          #=> true or false depending if it needs to be captured. (default: false)       
```

Example for this is present at /src/test/resources/rest/sample.feature