using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GlobalComponent
{
    private static GlobalComponent mInstance = null;

    public static GlobalComponent Instance
    {
        get
        {
            if (mInstance == null)
                mInstance = new GlobalComponent();

            return mInstance;
        }
    }

    private LuaState mLuaManager = null;

    public LuaState Lua
    {
        get
        {
            if(mLuaManager == null)
            {
                
                mLuaManager = new LuaState();
                mLuaManager.Start();
                LuaBinder.Bind(mLuaManager);
            }

            return mLuaManager;
        }
    }


}
