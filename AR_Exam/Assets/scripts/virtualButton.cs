using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Vuforia;

public class virtualButton : MonoBehaviour,IVirtualButtonEventHandler
{
    public GameObject objBTN;
    public GameObject Model;

    // Start is called before the first frame update
    void Start()
    {
        objBTN = GameObject.Find("playWithBtn");
        objBTN.GetComponent<VirtualButtonBehaviour>().RegisterEventHandler(this);
        Model.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void OnButtonPressed(VirtualButtonBehaviour vb)
    {
        Model.SetActive(true);
    }

    public void OnButtonReleased(VirtualButtonBehaviour vb)
    {
        Model.SetActive(false);
    }
}
