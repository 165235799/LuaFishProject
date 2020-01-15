using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameHUD : MonoBehaviour
{
    private void Awake()
    {
        GameObject obj = transform.Find("UITouch").gameObject;
        if (obj.GetComponent<LuaComponent>() == null)
            obj.AddComponent<LuaComponent>();

    }
}
