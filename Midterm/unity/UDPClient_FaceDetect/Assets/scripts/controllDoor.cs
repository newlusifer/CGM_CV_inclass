using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class controllDoor : MonoBehaviour
{
    public GameObject door;

    int statusDoor = 5;


    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (door.transform.position.y<=1)
        {
            statusDoor = 0;        
        }

        if (door.transform.position.y >= 3)
        {
            statusDoor = 1;           
        }

        if (statusDoor==0)
        {            
            door.transform.Translate(0.5f*Time.deltaTime,0,0);            
        }

        if (statusDoor == 1)
        {
            door.transform.Translate(-0.5f * Time.deltaTime, 0, 0);
            
        }
    }
}
