using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class TTSPlugin : MonoBehaviour {

	[DllImport ("__Internal")]
	private static extern void FooPluginFunction(string text);

	public void CallNativePlugin(string text) {
		Debug.Log ("TTS: Calling native plugin..");
		FooPluginFunction (text);
	}

	public void HelloUnity(string message) {
		Debug.Log ("TTS: "+ message);
	}
}
