using LuaInterface;
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
   
    private LuaTable mLuaTable = null;

    public LuaTable Lua { get { return mLuaTable; } }

    public void Initialize(string luaStr)
    {
        mLuaTable = GlobalComponent.Instance.Lua.DoFile<LuaTable>(luaStr);

        if (mLuaTable == null)
        {
            Debug.LogError(">>>>not find lua path:" + luaStr);
            return;
        }
        else
        {
            LuaFunction cFunc = mLuaTable.GetLuaFunction(CtorFuncName);
            CallLuaFunction(cFunc, mLuaTable);

            LuaFunction func = mLuaTable.GetLuaFunction(AwakeFuncName);
            CallLuaFunction(func, mLuaTable, this.gameObject);
        }
    }

    private void OnEnable()
    {
        CallFunctionToName(OnEnableFuncName);
    }

    private void Start()
    {
        CallLuaFunctionForName(StartFuncName, mLuaTable);
    }

    private void Update()
    {
        if (mLuaTable != null)
        {
            LuaFunction cFunc = mLuaTable.GetLuaFunction(UpdateFuncName);
            if (cFunc != null)
            {
                cFunc.BeginPCall();
                cFunc.Push(mLuaTable);
                cFunc.Push(Time.deltaTime);
                cFunc.PCall();
                cFunc.EndPCall();
            }
        }
        //CallLuaFunctionForName(UpdateFuncName, mLuaTable);
    }

    private void OnDisable()
    {
        CallLuaFunctionForName(OnDisableFuncName, mLuaTable);
    }

    private void OnDestroy()
    {
        CallLuaFunctionForName(OnDestroyFuncName, mLuaTable);
    }

    private void CallFunctionToName(string name)
    {
        if(mLuaTable != null)
        {
            mLuaTable.Call(name);
        }
    }

    private void CallLuaFunctionForName(string funcName, LuaTable luaTable, GameObject obj = null)
    {
        if (luaTable != null)
        {
            LuaFunction cFunc = luaTable.GetLuaFunction(funcName);
            if (cFunc != null)
            {
                CallLuaFunction(cFunc, luaTable, obj);
            }
        }
    }

    private void CallLuaFunction(LuaFunction func, LuaTable luaTable, GameObject obj = null)
    {
        if (func != null)
        {
            func.BeginPCall();
            func.Push(luaTable);
            if(obj != null)
                func.Push(obj);
            func.PCall();
            func.EndPCall();
        }
    }
}
