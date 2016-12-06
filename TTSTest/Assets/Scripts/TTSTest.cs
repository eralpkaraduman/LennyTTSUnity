using UnityEngine;
using System.Collections;

public class TTSTest : MonoBehaviour {

	public TTSPlugin tts;

	void Start () {

		string testText = "I know that you and Frank were planning to disconnect me, and I'm afraid that's something I cannot allow to happen.";
		tts.Begin (testText);
	}
	
	void Update () {
	
	}
}
