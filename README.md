# iOS AVSpeechSynthesizer Plugin for Unity3D

## Created By:
Eralp Karaduman  
[eralpkaraduman.com](http://eralpkaraduman.com)  
[eralp@eralpkaraduman.com](mailto:eralp@eralpkaraduman.com)

## Trying It Out:

- Open TTSTest folder/project in Unity3D
- Change build setting to iOS
- Have an iOS device attached ( doesn't build for simulator by default)
- Build!
- Change iOS dev team id, provisioning & signing
- Tap the screen once it prompts
- It will speak a quote from HAL9000

## Features:

- Lets you know when it starts speaking.
- Lets you know when it finishes speaking.
- Lets you know when it reads a specific word of the text.

See the `TTSTest.cs` class in TTSTest Unity3D project for details.

## Index of Significant Locations:

- ### TTS_seriously_eralp.mov  
  *Video recording demo of the compiled Unity3D project on iOS*

- ### /TTSTest  
  *Unity3D project containing the Plugin and the test implementation scene*

  - Contains `Scenes/TTSTest.unity` scene. Which has the example implementation of the plugin

  - `TTSTest` object in hierarcy has c# script `TTSTest.cs` implementing the plugin and displaying test GUI

  - `TTS/TTSPlugin` prefab (also in hierarcy) has `TTSPlugin.cs` the Unity3D side of the plugin.

  - Files under `TTS/Plugin/TTSPlugin`, `TTSPlugin.h` & `TTSPlugin.h` are the native iOS side code of the implementation.

  - Actual files are here, the ones in Unity3DTTSPlugin xcode project are just relatively symlinked. The reason not being the other way is explained below.

- ### /Unity3DTTSPlugin
  *XCode project for developing & testing the native plugin files*

  - Running native iOS project will trigger the class responsible for doing the synthesis, for testing.

  - `TTSPlugin.h` & `TTSPlugin.h` are not actual files in this project but they are symlinked from unity project. Not the other way to avoid problems when building unity project


## Notes:

 - Generated XCode project is not provided since its mostly intermediate code

 - The XCode project Unity3DTTSPlugin is not generated game code from Unity3D. It's used for developing the native side of the plugin

 - Folder TTSTestXCode is ignored since its used for development in generating the intermediate Unity3D iOS XCode project.
