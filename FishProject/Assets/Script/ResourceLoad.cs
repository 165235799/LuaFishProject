using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ResourceLoad
{
    public static void LoadAsset(string prefabStr, LuaFunction calback)
    {
#if UNITY_EDITOR
        GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(prefabStr);

#else

#endif
    }
}
