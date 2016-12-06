using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class TTSPlugin : MonoBehaviour {

	// to keep track of the speech
	private bool _isSpeaking = false;
	public bool isSpeaking { 
		get { return _isSpeaking; } 
	}

	private const string parameterDelimiter = "<#>";

	// this is linked to function void BeginSpeaking(char* text, char* voice) in TTSPlugin.m objc class 
	[DllImport ("__Internal")]
	private static extern void BeginSpeaking (string text, string voiceName);

	// delegates to let the user of the plugin watch the status

	// speaking just started
	public delegate void DidStartSpeakingHandler(string text);
	public DidStartSpeakingHandler didStartSpeakingHandler;

	// speaking finished
	public delegate void DidFinishSpeakingHandler();
	public DidFinishSpeakingHandler didFinishSpeakingHandler;

	// will start speaking a part of string
	// subString is the part of that it will speak
	// allString is the entire string it started to speak
	public delegate void WillSpeakSubStringHandler(string allString, string subString);
	public WillSpeakSubStringHandler willSpeakSubStringHandler;

	// to initiate the speech
	public void Begin(string text) {

		// This part only runs if environment is ios and not the editor
		#if UNITY_IPHONE && !UNITY_EDITOR
		BeginSpeaking (text, "Aaron");
		_isSpeaking = true;
		#endif
	}

	// All functions below are called from objc plugin via UnitySendMessage

	public void DidStartSpeaking(string text) {
		_isSpeaking = true;
		didStartSpeakingHandler(text);
	}

	public void DidFinishSpeaking() {
		_isSpeaking = false;
		didFinishSpeakingHandler();
	}

	public void WillSpeakSubString(string joinedParams) {

		// splits joined parameters into seperate paramters
		string[] strParams = joinedParams.Split (parameterDelimiter.ToCharArray());
		string subString = strParams[0];
		string allString = strParams[1];

		willSpeakSubStringHandler (allString, subString);
	}
}
