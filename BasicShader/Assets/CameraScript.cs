using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraScript : MonoBehaviour
{
	float time;
	GameObject sphere;

	readonly float speed = 1.2f;
	readonly float distance = 2.5f;
	
	/// <summary>
	/// start
	/// </summary>
	void Start()
	{
		sphere = GameObject.Find("Sphere");
	}

	/// <summary>
	/// update
	/// </summary>
	void Update()
	{
		// カメラ回転
		Vector3 p = transform.position;
		p.z = Mathf.Sin(Time.time * speed) * distance;
		p.x = Mathf.Cos(Time.time * speed) * distance;
		transform.position = p;
		transform.LookAt(sphere.transform);
	}
}
