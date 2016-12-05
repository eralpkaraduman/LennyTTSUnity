using UnityEngine;
using System.Collections;

public class TTSTest : MonoBehaviour {

	public TTSPlugin tts;

	// Use this for initialization
	void Start () {
		tts.CallNativePlugin ();
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
