using GK_Framework;
using LuaInterface;
using System.Collections;
using UnityEngine;

public class GlobalComponent : MonoBehaviour
{
    #region 单例
    private static GlobalComponent mInstance = null;
    public static GlobalComponent Instance
    {
        get
        {
            return mInstance;
        }
    }
    #endregion

    private LuaState mLuaManager = null;            //Lua 脚本管理
    private SocketManager mSocketManager = null;    //网络管理

    #region 属性

    public LuaState Lua
    {
        get
        {
            if (mLuaManager == null)
            {
                mLuaManager = new LuaState();
                mLuaManager.Start();
                LuaBinder.Bind(mLuaManager);
                DelegateFactory.Init();
            }

            return mLuaManager;
        }
    }

    public SocketManager ClientSocket
    {
        get
        {
            if (mSocketManager == null)
            {
                mSocketManager = new SocketManager();
                mSocketManager.SetSocketData("127.0.0.1", 8385);
            }

            return mSocketManager;
        }
    }

    #endregion




    private void Awake()
    {
        mInstance = this;
#if UNITY_EDITOR
        if (ConfigurationDefine.OpenAssetBundle)
        {
            StartCoroutine(LoadLuaFile());
        }
        else
        {
            //LuaMain();
            ClientSocket.ConnectServer();
        }
#endif
    }


    //lua脚本入口
    private void LuaMain()
    {
        LuaTable lua = GlobalComponent.Instance.Lua.DoFile<LuaTable>("LuaMain");
        if (lua == null)
        {
            Debug.LogError(">>>>not find lua path LuaMain");
            return;
        }
        else
        {
            LuaFunction cFunc0 = lua.GetLuaFunction("main");
            if (cFunc0 != null)
            {
                cFunc0.BeginPCall();
                cFunc0.PCall();
                cFunc0.EndPCall();
            }
        }
    }

    /// <summary>
    /// 读取Lua热更文件
    /// </summary>
    /// <returns></returns>
    IEnumerator LoadLuaFile()
    {
        string path = "file://" + string.Format(Application.persistentDataPath + "/Assetbundle/lua.unity3d"); ;
        WWW www = new WWW(path);
        yield return www;

        AssetBundle luaAsset = www.assetBundle;
        foreach (string name in luaAsset.GetAllAssetNames())
        {
            Debug.LogWarning(">>>>>>>>>>>>>>Name = " + name);
        }
        LuaFileUtils.Instance.AddSearchBundle(luaAsset.name, luaAsset);

        LuaMain();
    }
}
