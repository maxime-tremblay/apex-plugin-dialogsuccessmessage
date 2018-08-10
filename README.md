# Oracle APEX Dynamic Action Plugin - Show Close Dialog Success Message
This dynamic action plugin is used to display the Success Message from the corresponding Dialog Close process.

> If you are using APEX 5.0 or not using the universal theme, use [release 1.2](./releases/tag/v1.2). Otherwise, use the [lastest release](./releases/latest).

## Changelog
### 2.0
  - New version that uses the APEX 5.1 message API

### 1.2
  - Bug fix
    - Messages were not displayed on some page template

### 1.1
  - New attribute
    - Message Override: Can be used to override the dialog close message or only to show a success message on the page.

### 1.0
  - Initial Release

## Install
- Import plugin file "dynamic_action_plugin_ca_maximet_apexdialogsuccessmessage.sql" from source directory into your application
- (Optional) Deploy the JS files from "server" directory on your webserver and change the "File Prefix" to webservers folder.

## Plugin Settings
### Application Attribute
- **Logging** - Whether to log events in the console (default: false)
- **Wrapping Class** - Wrapping element class (default: t-Body-alert-wrap)
- **Close Trigger** - Selector of the close trigger (default: .t-Body-alert .t-Alert .t-Alert-buttons .t-Button.t-Button--closeAlert)

### Component Attribute
- **Close Notification Text** - Close Notification Text (Default: Close Notification)
- **Override Message** - Used to override the close dialog message (can also be used to show a custom message not triggerred by a dialog closed)
  - Yes
  - No
- **Notification Message** - Message to display (Only available when `Override Message = Yes`)

## How to use
Taking for granted that you have a page calling a modal page and that it's closing using a Close Dialog Process with a Success Message.

On the parent page:
- Create a new Dynamic Action with event "Dialog Closed"
- As action choose "Show Close Dialog Success Message"

## Demo Application
[http://max-playground.no-ip.org/ords/f?p=DEMO:1500](http://max-playground.no-ip.org/ords/f?p=DEMO:1500)

## Preview
## ![](https://github.com/maxime-tremblay/apex-plugin-dialogsuccessmessage/blob/master/preview.gif)