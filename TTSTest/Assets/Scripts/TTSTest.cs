using UnityEngine;
using UIText = UnityEngine.UI.Text;
using System.Collections;

public class TTSTest : MonoBehaviour {

	public TTSPlugin tts;
	public UIText uiText;

	string lenny = "( ͡° ͜ʖ ͡°)";
	string tapText = "Tap to start TTS";

	void Awake() {
	
		uiText.text = lenny+"\r\n"+tapText;
		tts.didStartSpeakingDelegate = DidStartSpeaking;
		tts.didFinishSpeakingDelegate = DidFinishSpeaking;
		tts.willSpeakSubStringDelegate = WillSpeakSubstring;
	}

	void Start () {
		
	}

	public void DidTapButton() {
		
		if (tts.isSpeaking == true) {
			return;
		}
			
		string testText = "I know that you and Frank were planning to disconnect me, and I'm afraid that's something I cannot allow to happen.";
		tts.Begin (testText);	

		uiText.text = lenny+"\r\nPRE UTTERANCE\r\nDELAY APPLIED";
	}

	public void DidStartSpeaking(string text) {

		uiText.text = lenny+"\r\nTTS STARTED.\r\n"+ text;
	}

	public void DidFinishSpeaking() {
		
		uiText.text = lenny+"\r\nTTS FINISHED.\r\n"+ tapText;
	}

	public void WillSpeakSubstring(string allString, string subString) {

		uiText.text = lenny+"\r\nTTS SPEAKING:\r\n"+ subString;
	}
}
