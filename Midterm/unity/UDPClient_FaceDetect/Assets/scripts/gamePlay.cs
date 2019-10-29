using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gamePlay : MonoBehaviour
{   

    public GameObject[] NPC=new GameObject[6];

    int play = 0;


    // Start is called before the first frame update
    void Start()
    {
        for (int i=0;i<6;i++)
        {
            NPC[i].SetActive(false);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (play==1)
        {
            
            
        }
    }//end update

    public void RanDomNPC()
    {
        int ran = Random.Range(0, 5);
        NPC[ran].SetActive(true);



    }
}
