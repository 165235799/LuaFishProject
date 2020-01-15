using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ResourceLoad
{
    public static void LoadAsset(string prefabStr, Transform trans, LuaFunction calback)
    {
#if UNITY_EDITOR
       // prefabStr = Application.dataPath + prefabStr;
        GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(prefabStr);
        if(obj == null)
        {
            Debug.LogError(prefabStr + "not find prefab");
            return;
        }

        GameObject instanceObj = GameObject.Instantiate(obj, Vector3.zero, Quaternion.identity, trans);
        if (instanceObj == null)
        {
            Debug.LogError("instanceObj prefab  find prefab failure");
            return;
        }

        if(calback != null)
        {
            calback.BeginPCall();
            calback.Push(obj);
            calback.PCall();
            calback.EndPCall();
        }
#else

#endif
    }

    public static void LoadAsset(string prefabStr, GameObject obj, LuaFunction calback)
    {
#if UNITY_EDITOR
        LoadAsset(prefabStr, obj.transform, calback);
#else

#endif
    }

}
