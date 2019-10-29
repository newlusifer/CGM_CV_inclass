using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class controllPLayer : MonoBehaviour
{
    public static string textFromCam="00";
    public GameObject player;

    string test1 = "";
    string test2 = "";

    public GameObject[] NPC = new GameObject[6];

    int MoveOrHide = 0;

    int score = 0;

    public GameObject door;

    int ran =0;


    // Start is called before the first frame update
    void Start()
    {
        
        player.SetActive(false);        

        NPC[0].SetActive(false);
        NPC[1].SetActive(false);
        NPC[2].SetActive(false);
        NPC[3].SetActive(false);
        NPC[4].SetActive(false);
        NPC[5].SetActive(false);

        door.SetActive(true);
       
    }

    // Update is called once per frame
    void Update()
    {
        if (test1 == "" && textFromCam != "00")
        {
            test1 = textFromCam;
        }

        else if (test2 == "" && test1 != ""&& textFromCam != test1)
        {
            test2 = textFromCam;
        }

        Debug.Log("Testttttt "+test1+" "+test2);

       // Debug.Log("TextFromCamTest 01 " + textFromCam);

        if (textFromCam==test1)
        {
            Debug.Log("TextFromCamTest 01 " + textFromCam);
            player.SetActive(false);
        }

        if (textFromCam == test2)
        {
            Debug.Log("TextFromCamTest 02 " + textFromCam);
            player.SetActive(true);
        }      
    }//end update

    public void ReadyToPlay()
    {
        door.SetActive(false);         

        NPC[0].SetActive(false);
        NPC[1].SetActive(false);
        NPC[2].SetActive(false);
        NPC[3].SetActive(false);
        NPC[4].SetActive(false);
        NPC[5].SetActive(false);        

         ran = Random.Range(0, 5);

        NPC[ran].SetActive(true);

        if (ran==0||ran==1||ran==2)
        {
            MoveOrHide = 1;
        }

        if (ran == 3 || ran == 4 || ran == 5)
        {
            MoveOrHide = 2;
        }

         StartCoroutine(wait());
        
    }  

    IEnumerator wait()
    {
        
    yield return new WaitForSeconds(5f);

        if (MoveOrHide == 1 && textFromCam == test1)
        {
            
            GameManager.score += 15;        
            Debug.Log("Score : " + score);
            door.SetActive(true);

        }

        else if (MoveOrHide == 1 && textFromCam == test2)
        {
            //game Over
            Debug.Log("Over");
            door.SetActive(true);
            sceneManager.gameOverEnd = 1;
        }

        if (MoveOrHide == 2 && textFromCam == test2)
        {
            
            GameManager.score += 15;
            Debug.Log("Score : " + score);
            door.SetActive(true);
        }

        else if (MoveOrHide == 2 && textFromCam == test1)
        {
            //game Over
            Debug.Log("Over");
            door.SetActive(true);
            sceneManager.gameOverEnd = 1;
        }



       // door.SetActive(true);
    }
}
