using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LuaComponent : MonoBehaviour
{
    public readonly string CtorFuncName = "ctor";
    public readonly string AwakeFuncName = "Awake";
    public readonly string OnEnableFuncName = "OnEnable";
    public readonly string StartFuncName = "Start";
    public readonly string UpdateFuncName = "Update";
    public readonly string OnDisableFuncName = "OnDisable";
    public readonly string OnDestroyFuncName = "OnDestroy";
   

    LuaTable mLuaTable = null;

    private void Awake()
    {
        string pathStr = "Game/HUD/UITouch.lua";
        mLuaTable = GlobalComponent.Instance.Lua.DoFile<LuaTable>(pathStr);
        if (mLuaTable == null)
            Debug.LogError(">>>>not find lua path:" + pathStr);

        LuaFunction cFunc = mLuaTable.GetLuaFunction(CtorFuncName);
        if (cFunc != null)
        {
            cFunc.BeginPCall();
            cFunc.Push(mLuaTable);
            cFunc.PCall();
            cFunc.EndPCall();
        }

        LuaFunction func = mLuaTable.GetLuaFunction(AwakeFuncName);
        if(func != null)
        {
            func.BeginPCall();
            func.Push(mLuaTable);
            func.Push(this.gameObject);
            func.PCall();
            func.EndPCall();
        }
    }

    private void OnEnable()
    {
        mLuaTable.Call(OnEnableFuncName);
    }

    private void Start()
    {
        mLuaTable.Call(StartFuncName);
    }

    private void Update()
    {
        mLuaTable.Call(UpdateFuncName);
    }

    private void OnDisable()
    {
        mLuaTable.Call(OnDisableFuncName);
    }

    private void OnDestroy()
    {
        mLuaTable.Call(OnDestroyFuncName);
    }
}
