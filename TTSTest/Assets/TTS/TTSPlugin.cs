using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class TTSPlugin : MonoBehaviour {

	bool _isSpeaking = false;

	public bool isSpeaking {
		get { return _isSpeaking; }
	}

	[DllImport ("__Internal")]
	private static extern void BeginSpeaking (string text, string voiceName);

	public delegate void DidStartSpeakingDelegate(string text);
	public DidStartSpeakingDelegate didStartSpeakingDelegate;

	public delegate void DidFinishSpeakingDelegate();
	public DidFinishSpeakingDelegate didFinishSpeakingDelegate;

	public delegate void WillSpeakSubStringDelegate(string allString, string subString);
	public WillSpeakSubStringDelegate willSpeakSubStringDelegate;

	public void Begin(string text) {

		#if UNITY_IPHONE && !UNITY_EDITOR
		BeginSpeaking (text, "Aaron");
		_isSpeaking = true;
		#endif
	}

	public void DidStartSpeaking(string text) {
		_isSpeaking = true;
		didStartSpeakingDelegate (text);
	}

	public void DidFinishSpeaking() {
		_isSpeaking = false;
		didFinishSpeakingDelegate ();
	}

	public void WillSpeakSubString(string csvParams) {

		//Debug.Log ("CSV: "+csvParams);

		string[] strParams = csvParams.Split ("<#>".ToCharArray());
		string subString = strParams[0];
		string allString = strParams[1];

		Debug.Log ("CSV: allstring: "+allString);
		Debug.Log ("CSV: subString: "+subString);

		willSpeakSubStringDelegate (allString, subString);
	}
}
