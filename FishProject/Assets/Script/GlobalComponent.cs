using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalComponent : MonoBehaviour
{
    private static GlobalComponent mInstance = null;

    public static GlobalComponent Instance
    {
        get
        {
            return mInstance;
        }
    }

    private LuaState mLuaManager = null;

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

    private void Awake()
    {
        mInstance = this;
    }

    private void Start()
    {
        LuaMain();
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
}
