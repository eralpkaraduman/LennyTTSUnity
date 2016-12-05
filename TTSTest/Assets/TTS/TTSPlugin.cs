using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class TTSPlugin : MonoBehaviour {

	[DllImport ("__Internal")]
	private static extern void FooPluginFunction();

	public void CallNativePlugin() {
		Debug.Log ("TTS: Calling native plugin..");
		FooPluginFunction ();
	}

	public void HelloUnity(string message) {
		Debug.Log ("TTS: "+ message);
	}
}
