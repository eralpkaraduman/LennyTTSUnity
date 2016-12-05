using UnityEngine;
using System.Collections;

public class TTSTest : MonoBehaviour {

	public TTSPlugin tts;

	// Use this for initialization
	void Start () {
		tts.CallNativePlugin ("From Unity, With Love!");
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
