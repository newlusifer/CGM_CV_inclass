using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class sceneManager : MonoBehaviour
{
  public static int gameOverEnd = 0;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (gameOverEnd==1)
        {
            GameOver();
            gameOverEnd = 0;
        }
    }

    public void GameOver()
    {
        SceneManager.LoadScene("Gameover");
    }

    public void Restart()
    {
        SceneManager.LoadScene("MainGame");
        GameManager.score = 0;
    }

    public void play()
    {
        SceneManager.LoadScene("MainGame");
    }

    public void QuiteApp()
    {
        Application.Quit();
    }

}
