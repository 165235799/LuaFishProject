using LuaInterface;
using SWS;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class ResourceLoad
{
    /// <summary>
    /// 实例化预制体
    /// </summary>
    /// <param name="prefabStr">预制体路径</param>
    /// <param name="trans">父节点</param>
    /// <param name="calback">生成成功回调</param>
    public static void LoadAsset(string prefabStr, Transform trans, LuaFunction calback)
    {
#if UNITY_EDITOR
        // prefabStr = Application.dataPath + prefabStr;
        string fullPath = ResourceConstant.RootPath + prefabStr;
        GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(fullPath);
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
            calback.Push(instanceObj);
            calback.PCall();
            calback.EndPCall();
        }
#else

#endif
    }

    /// <summary>
    /// 创建实例,并绑定LuaTable
    /// </summary>
    /// <param name="prefabStr">Prefab路径</param>
    /// <param name="luaPath">Lua脚本路径</param>
    /// <param name="trans">父节点</param>
    /// <param name="calback">创建完成实例</param>
    public static void InstancePrefab(string prefabStr, string luaPath, LuaFunction calback)
    {
#if UNITY_EDITOR
        string fullPath = ResourceConstant.RootPath + prefabStr;
        GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(fullPath);
        if (obj == null)
        {
            Debug.LogError(prefabStr + "not find prefab");
            return;
        }

        GameObject instanceObj = GameObject.Instantiate(obj, Vector3.zero, Quaternion.identity);

        if (instanceObj == null)
        {
            Debug.LogError("instanceObj prefab  find prefab failure");
            return;
        }

        LuaComponent luaCom = instanceObj.AddComponent<LuaComponent>();
        luaCom.Initialize(luaPath);

        if (calback != null)
        {
            calback.BeginPCall();
            calback.Push(luaCom.Lua);
            calback.PCall();
            calback.EndPCall();
        }
#else

#endif
    }


    /// <summary>
    /// 创建实例,并绑定LuaTable
    /// </summary>
    /// <param name="prefabStr">Prefab路径</param>
    /// <param name="luaPath">Lua脚本路径</param>
    /// <param name="trans">父节点</param>
    /// <param name="calback">创建完成实例</param>
    public static void InstancePrefab(string prefabStr, string luaPath, Transform trans, LuaFunction calback)
    {
#if UNITY_EDITOR
        string fullPath = ResourceConstant.RootPath + prefabStr;
        GameObject obj = AssetDatabase.LoadAssetAtPath<GameObject>(fullPath);
        if (obj == null)
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

        LuaComponent luaCom = instanceObj.AddComponent<LuaComponent>();
        luaCom.Initialize(luaPath);

        if (calback != null)
        {
            calback.BeginPCall();
            calback.Push(luaCom.Lua);
            calback.PCall();
            calback.EndPCall();
        }
#else

#endif
    }

    public static void LoadAsset(string prefabStr, GameObject obj, LuaFunction callback)
    {
#if UNITY_EDITOR
        LoadAsset(prefabStr, obj.transform, callback);
#else

#endif
    }

    /// <summary>
    /// 创建鱼模型
    /// </summary>
    /// <param name="luaPath">鱼Lua脚本路径</param>
    /// <param name="fishInfo">鱼信息</param>
    /// <param name="parentNode">父节点</param>
    /// <param name="callback">回调函数</param>
    public static void CreateFish(string luaPath, LuaTable fishInfo, GameObject parentNode, LuaFunction callback)
    {
#if UNITY_EDITOR
        CreateFish(luaPath, fishInfo, parentNode.transform, callback);
#else

#endif
    }

    /// <summary>
    /// 创建鱼模型
    /// </summary>
    /// <param name="luaPath">鱼Lua脚本路径</param>
    /// <param name="fishInfo">鱼信息</param>
    /// <param name="parentNode">父节点</param>
    /// <param name="callback">回调函数</param>
    public static void CreateFish(string luaPath, LuaTable fishInfo, Transform parentNode, LuaFunction callback)
    {
#if UNITY_EDITOR
        GameObject objPrefab = AssetDatabase.LoadAssetAtPath<GameObject>(ResourceConstant.FishPrefabPath);
        if(objPrefab == null)
        {
            Debug.LogError("Can not find fish prefab");
            return;
        }

        GameObject obj = GameObject.Instantiate(objPrefab);
        obj.transform.parent = parentNode;
        obj.transform.localScale = Vector3.one;
        obj.transform.localPosition = Vector3.zero;
        obj.AddComponent<splineMove>();
        LuaComponent luaCom = obj.AddComponent<LuaComponent>();
        luaCom.Initialize(luaPath);
        if (callback != null)
        {
            callback.BeginPCall();
            callback.Push(luaCom.Lua);
            callback.Push(fishInfo);
            callback.PCall();
            callback.EndPCall();
        }
        else
        {
            Debug.LogError("Add Component LuaComponent is failed");
        }
#else

#endif
    }

}
