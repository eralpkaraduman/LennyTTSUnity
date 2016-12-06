using UnityEngine;
using UIText = UnityEngine.UI.Text;
using System.Collections;

public class TTSTest : MonoBehaviour {

	// plugin prefab in hierarcy is associated to this public var from the editor
	public TTSPlugin tts;

	// UIText instance in canvas to display status
	public UIText uiText;

	// Let's give the speech a face
	const string lenny = "( ͡° ͜ʖ ͡°)";

	const string tapText = "Tap to start TTS";

	// The text used for speech synthesis
	const string testText = @"I know that you and Frank were planning to disconnect me, and 
		I'm afraid that's something I cannot allow to happen.";

	void Awake() {
	
		uiText.text = lennyfiedMessage (tapText, "");

		// set handling functions to delegates, these are coming from the objc call
		tts.didStartSpeakingHandler = DidStartSpeaking;
		tts.didFinishSpeakingHandler = DidFinishSpeaking;
		tts.willSpeakSubStringHandler = WillSpeakSubstring;
	}

	// When user taps anywhere in the screen
	public void DidTapButton() {

		// does nothing if there's an ongoing speech
		if (tts.isSpeaking == true) { return; }

		// els starts the speech
		tts.Begin(testText);	

		// native plugin applies some delay before speaking, this let's the user know that its not jammed
		uiText.text = lennyfiedMessage("PRE UTTERANCE", "DELAY APPLIED");
	}

	public void DidStartSpeaking(string text) {
		
		uiText.text = lennyfiedMessage("TTS STARTED", text);
	}

	public void DidFinishSpeaking() {
		
		uiText.text = lennyfiedMessage("TTS FINISHED", tapText);
	}

	// Plugin sends message about which part of the message its reading

	public void WillSpeakSubstring(string allString, string subString) {

		uiText.text = lennyfiedMessage("TTS SPEAKING", subString);
	}

	// Util to print status with the face

	private string lennyfiedMessage(string title, string subtite) {

		return lenny + "\r\n" + title + "\r\n" + subtite;
	}
}
