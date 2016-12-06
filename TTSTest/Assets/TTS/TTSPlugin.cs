using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class TTSPlugin : MonoBehaviour {

	[DllImport ("__Internal")]
	private static extern void BeginSpeaking (string text);

	public void Begin(string text) {
		BeginSpeaking (text);
	}

	public void DidStartSpeaking(string text) {
		Debug.Log ("TTS: DidStartSpeaking:"+ text);
	}

	public void DidFinishSpeaking() {
		Debug.Log ("TTS: DidFinishSpeaking");
	}

	public void WillSpeakSubString(string csvParams) {
		Debug.Log ("TTS: WillSpeakSubString:"+ csvParams);
	}
}
